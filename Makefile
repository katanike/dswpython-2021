EC2_SSH_PEM_PATH := ~/.ssh/ds-key-pair.pem
S3_BUCKET_URI	 := s3://uwm-dswpraktyce-2021
EMR_MASTER_IP 	 := 34.230.25.190
USER_ID			 := user-01
ACCOUNT_ID		 := 619731119112


.PHONY: replace_cached_key
replace_cached_key:
	ssh-keygen -R $(EMR_MASTER_IP)

.PHONY: ssh_into_master
ssh_into_master: replace_cached_key
	ssh -i $(EC2_SSH_PEM_PATH) hadoop@$(EMR_MASTER_IP)

.PHONY: ssh_tunnel_into_master
ssh_tunnel_into_master: replace_cached_key
	ssh -i $(EC2_SSH_PEM_PATH) -ND 8157 hadoop@$(EMR_MASTER_IP)

.PHONY: enable_hue
enable_hue: replace_cached_key
	ssh -i $(EC2_SSH_PEM_PATH) -L 8888:$(EMR_MASTER_IP):8888 hadoop@$(EMR_MASTER_IP) -fN
