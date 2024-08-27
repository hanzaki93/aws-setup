# includes
include .env # 環境変数
include ../../tools/make/lib/backend.mk # backend関連コマンド

create-terraform-backend: # Backendを作成する
	@( make create-s3-backet-for-terraform-backend )
