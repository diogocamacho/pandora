---
tags:
  - quick
  - x2
  - compbio
  - ai
Follow up:
---

---
### 🧠 Note
screen -S x2-cli
cd /home/ubuntu/projects/x2
export PYTHONPATH=$(pwd)
export OPENAI_API_KEY=[REDACTED - Store in environment variables or .env file]
RUN_STORE_DB_PATH=$(pwd)/db/run_store.db python3 cli_runs/run_cli_analysis.py cli_runs