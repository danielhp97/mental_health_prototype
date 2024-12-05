from .database import create_db_and_tables_with_retry

@app.on_event("startup")
def on_startup():
    create_db_and_tables_with_retry()