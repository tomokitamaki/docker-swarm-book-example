# Docker Swarmで始めるお手軽コンテナ運用 - サンプルコード

このリポジトリは、書籍「Docker Swarmで始めるお手軽コンテナ運用」のサンプルコード集です。
Docker Swarmを使った実践的なコンテナオーケストレーションの手法を学ぶことができます。

## 必要な環境

- Docker Engine 20.10以上
- Docker Swarm モード有効化済み

### Swarmモードの初期化

```bash
# Swarmマネージャーノードの初期化
docker swarm init

# ワーカーノードの追加（マネージャーノードで実行してトークンを取得）
docker swarm join-token worker
```

## サンプル一覧

### nginx - 基本的なNginxサービス

Docker SwarmでConfigsを使用した基本的なNginxサービスのデプロイ例です。

- Docker Configsの使用方法
- 設定ファイルの外部化

📁 `nginx/`

### nginx-ssl - SSL/TLS対応Nginx

SSL証明書をSecretsで管理するNginxサービスのデプロイ例です。

- Docker Secretsの使用方法
- SSL証明書の安全な管理
- SOPS（Secrets OPerationS）を使った暗号化

📁 `nginx-ssl/`

### postgresql - PostgreSQLデータベース

環境変数とボリュームを使用したPostgreSQLのデプロイ例です。

- 環境変数による設定管理
- 永続化ボリュームの使用
- データベースの初期化

📁 `postgresql/`

### traefik - リバースプロキシ

Traefikを使ったリバースプロキシとロードバランサーの設定例です。

- 動的なサービスディスカバリー
- SSL/TLS証明書の管理
- ルーティング設定

📁 `traefik/`

### swarm-cd - GitOpsベースのデプロイ

SwarmCDを使ったGitOpsスタイルのデプロイメント例です。

- GitリポジトリからのCD（継続的デリバリー）
- 自動デプロイメント
- スタック管理の自動化

📁 `swarm-cd/`

### swarm-cd-secret - Secretsを使ったGitOps

SwarmCDとSOPSを組み合わせた、暗号化されたSecretsを扱うデプロイメント例です。

- 暗号化されたSecretsの管理
- age暗号化の使用
- 安全なGitOpsワークフロー

📁 `swarm-cd-secret/`

## 使い方

各サンプルディレクトリに移動して、サービスをデプロイしてください。

```bash
# 例：Nginxサービスのデプロイ
cd nginx
docker stack deploy -c compose.yaml nginx

# デプロイ確認
docker stack services nginx
```

デプロイスクリプトが含まれているサンプルでは、以下のように実行できます。

```bash
cd traefik
./deploy.sh
```

## クリーンアップ

```bash
# 特定のスタックを削除
docker stack rm <stack-name>

# すべてのスタックを確認して削除
docker stack ls
docker stack rm $(docker stack ls --format "{{.Name}}")

# Swarmモードの無効化（開発環境の場合）
docker swarm leave --force
```

## トラブルシューティング

### サービスが起動しない場合

```bash
# サービスのログを確認
docker service logs <service-name>

# サービスの詳細を確認
docker service ps <service-name> --no-trunc

# ノードの状態を確認
docker node ls
```

### ネットワークの問題

```bash
# ネットワーク一覧を確認
docker network ls

# ネットワークの詳細を確認
docker network inspect <network-name>
```

### Secretsの問題

```bash
# Secrets一覧を確認
docker secret ls

# Secretsの詳細を確認
docker secret inspect <secret-name>
```

## 参考リソース

- [Docker Swarm 公式ドキュメント](https://docs.docker.com/engine/swarm/)
- [Docker Compose 仕様](https://docs.docker.com/compose/compose-file/)
- [SOPS - Secrets OPerationS](https://github.com/mozilla/sops)
- [SwarmCD](https://github.com/swarm-cd/swarm-cd)

## ライセンス

MIT License
