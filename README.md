# terraform-sakura-cloud
```bash
cat <<'EOF'> .env && source .env
export TF_VAR_SAKURACLOUD_ACCESS_TOKEN=" "
export TF_VAR_SAKURACLOUD_ACCESS_TOKEN_SECRET=" "
export TF_VAR_SAKURACLOUD_ZONE=" "
export TF_VAR_SSH_KEY_IDS=" "
export TF_VAR_PRIVATE_KEY_INSTANCE_PATH=" "
export TF_VAR_SSH_PUBLIC_KEY_PATH=" "
export TF_VAR_API_KEY_ID=" "
export TF_VAR_PASSWORD=" "
EOF
```

## zone
- is1a(石狩第1)
- is1b(石狩第2)
- tk1a(東京第1)
- tk1v(サンドボックス)