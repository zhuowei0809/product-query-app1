/**
 * Cloudflare Worker 代码
 * 作用：作为“中间人”转发请求，解决 CORS 跨域问题，并保护 API Key
 */

export default {
  async fetch(request, env, ctx) {
    // ============================================================
    // 1. 处理 CORS 预检请求 (浏览器的“保安”询问)
    // ============================================================
    // 当浏览器尝试跨域访问时，会先发一个 OPTIONS 请求问：“我可以访问吗？”
    // 这里我们直接回答：“可以，任何来源(*)，任何头信息都可以。”
    if (request.method === "OPTIONS") {
      return new Response(null, {
        headers: {
          "Access-Control-Allow-Origin": "*", // 允许所有网站访问（生产环境可以换成你自己的域名）
          "Access-Control-Allow-Methods": "POST, OPTIONS",
          "Access-Control-Allow-Headers": "Content-Type",
        },
      });
    }

    // ============================================================
    // 2. 只允许 POST 请求
    // ============================================================
    if (request.method !== "POST") {
      return new Response("Method Not Allowed", { status: 405 });
    }

    // ============================================================
    // 3. 准备转发给 Get笔记 API
    // ============================================================
    // 这是 Get笔记 的真实 API 地址
    const targetUrl = "https://api.biji.com/v1/knowledge/query";
    
    // 从环境变量中获取 API Key (这是存放在 Cloudflare 后台保险箱里的，不再暴露在代码里)
    const apiKey = env.GET_NOTE_API_KEY;

    if (!apiKey) {
      return new Response(JSON.stringify({ error: "Server Error: API Key not configured" }), {
        status: 500,
        headers: { 
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*" 
        }
      });
    }

    // ============================================================
    // 4. 执行“中间人”转发动作
    // ============================================================
    try {
      // 获取前端发来的数据
      const originalBody = await request.json();

      // 向 Get笔记 发起真正的请求
      const response = await fetch(targetUrl, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${apiKey}` // ★★★ 关键步骤：在这里悄悄把 Key 放进去
        },
        body: JSON.stringify(originalBody)
      });

      // ============================================================
      // 5. 把结果返回给前端
      // ============================================================
      const data = await response.text();
      
      // 原样返回数据，但加上允许跨域的头信息
      return new Response(data, {
        status: response.status,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*", // 再次告诉浏览器：“放行吧，即使是跨域也没事”
        }
      });

    } catch (e) {
      // 发生错误时的处理
      return new Response(JSON.stringify({ error: e.message }), {
          status: 500,
          headers: { 
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*" 
          }
      });
    }
  }
};
