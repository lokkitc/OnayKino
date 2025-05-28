import uvicorn
from fastapi import FastAPI
from dotenv import load_dotenv
import os
from pathlib import Path
import asyncio
from fastapi.middleware.cors import CORSMiddleware

env_path = Path(__file__).parent / '.env'
load_dotenv(dotenv_path=env_path)

app = FastAPI(title="Media Service")

# Настройка CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Media Service is running"}

@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    host = os.getenv("HOST", "0.0.0.0")
    port = int(os.getenv("PORT", "5005"))
    debug = os.getenv("DEBUG", "False").lower() == "true"
    
    uvicorn.run(
        app,
        host=host,
        port=port,
        reload=debug,
        loop="asyncio"
    )



