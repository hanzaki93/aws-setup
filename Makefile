# includes
include .env # 環境変数
include ./mk/backend.mk # backend関連コマンド

s3_bucket_name := $(TERRAFORM_BACKEND)

create-terraform-backend: # Backendを作成する
	@( make create-s3-backet-for-terraform-backend )
