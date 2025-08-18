module.exports = {
  apps: [
    {
      name: 'lumina-diy',
      script: 'npm',
      args: 'run dev',
      cwd: '/home/user/webapp',
      env: {
        NODE_ENV: 'development',
        PORT: 5173,
        HOST: '0.0.0.0',
        NODE_OPTIONS: '--max-old-space-size=4096'
      },
      watch: false,
      instances: 1,
      exec_mode: 'fork',
      max_memory_restart: '2G',
      error_file: './logs/err.log',
      out_file: './logs/out.log',
      log_file: './logs/combined.log',
      time: true,
      autorestart: true,
      restart_delay: 1000
    }
  ]
}