// Simple Node.js server to serve home.html as the default page
const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

const PORT = 8080;
const PUBLIC_DIR = __dirname;

const server = http.createServer((req, res) => {
  // Parse the requested URL
  let pathname = url.parse(req.url).pathname;
  
  // If root is requested, serve home.html
  if (pathname === '/' || pathname === '') {
    pathname = '/home.html';
  }
  
  // Construct file path
  let filePath = path.join(PUBLIC_DIR, pathname);
  
  // Prevent directory traversal attacks
  filePath = path.normalize(filePath);
  if (!filePath.startsWith(PUBLIC_DIR)) {
    res.writeHead(403, { 'Content-Type': 'text/plain' });
    res.end('Forbidden');
    return;
  }
  
  // Try to serve the file
  fs.readFile(filePath, (err, data) => {
    if (err) {
      // File not found
      res.writeHead(404, { 'Content-Type': 'text/plain' });
      res.end('File not found');
      return;
    }
    
    // Determine content type
    const ext = path.extname(filePath);
    let contentType = 'text/plain';
    
    switch (ext) {
      case '.html':
        contentType = 'text/html';
        break;
      case '.css':
        contentType = 'text/css';
        break;
      case '.js':
        contentType = 'application/javascript';
        break;
      case '.json':
        contentType = 'application/json';
        break;
      case '.png':
        contentType = 'image/png';
        break;
      case '.jpg':
      case '.jpeg':
        contentType = 'image/jpeg';
        break;
      case '.gif':
        contentType = 'image/gif';
        break;
      case '.svg':
        contentType = 'image/svg+xml';
        break;
    }
    
    // Set cache control headers
    res.writeHead(200, { 
      'Content-Type': contentType,
      'Cache-Control': 'no-cache, no-store, must-revalidate',
      'Pragma': 'no-cache',
      'Expires': '0'
    });
    res.end(data);
  });
});

server.listen(PORT, () => {
  console.log(`\n✅ Server running at http://localhost:${PORT}`);
  console.log(`📄 Default file: home.html`);
  console.log(`📁 Serving files from: ${PUBLIC_DIR}\n`);
});

// Handle graceful shutdown
process.on('SIGTERM', () => {
  console.log('\n⛔ Server shutting down...');
  server.close(() => {
    console.log('Server closed');
    process.exit(0);
  });
});
