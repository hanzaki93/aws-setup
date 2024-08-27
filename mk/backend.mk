create-s3-backet-for-terraform-backend:
	@( \
		aws s3api create-bucket --bucket $(s3_bucket_name) --create-bucket-configuration LocationConstraint=$(region) && \
		aws s3api put-bucket-versioning --bucket $(s3_bucket_name) --versioning-configuration Status=Enabled && \
		aws s3api put-bucket-encryption  --bucket $(s3_bucket_name) \
			--server-side-encryption-configuration '{ "Rules": [ { "ApplyServerSideEncryptionByDefault": { "SSEAlgorithm": "AES256" } } ] }' && \
		aws s3api put-public-access-block --bucket $(s3_bucket_name) \
			--public-access-block-configuration '{ "BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}' \
	)
