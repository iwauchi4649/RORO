# conohaのサーバーのIP、ログインするユーザー名、サーバーの役割
# xxxの部分はサーバーのIPアドレス
# 10022はポートを変更している場合。通常は22
server '133.167.65.60', user: 'syoma', group: "wheel", roles: %w{app db web}, port: 61203 

#デプロイするサーバーにsshログインする鍵の情報。サーバー編で作成した鍵のパス
  set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
  }