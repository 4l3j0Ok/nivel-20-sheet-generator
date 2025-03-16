import uvicorn
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse, HTMLResponse, JSONResponse
from pydantic import HttpUrl
from controllers import character
from controllers.exceptions import Nivel20APIError, ConvertCharacterError, InvalidURL
import config
from logger import logger

app = FastAPI(title=config.Application.name, version=config.Application.version)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/", include_in_schema=False)
def redirect_to_docs():
    return RedirectResponse(url="/docs")


@app.get("/alive")
def read_root():
    return {"status": "alive"}


@app.get("/base-character")
async def base_character(
    character_url: HttpUrl = "https://nivel20.com/s/yfv6zczc",
) -> JSONResponse:
    """Obtiene un personaje desde Nivel20 con la estructura original proporcionada por Nivel20."""
    try:
        # character = get_base_character(character_url)
        ch = character.get_base_character(str(character_url))
        return JSONResponse(
            content=ch,
            status_code=200,
        )
    except InvalidURL as e:
        raise HTTPException(status_code=400, detail=str(e))
    except Nivel20APIError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except Exception as e:
        logger.error(f"Error al obtener el personaje: {e}")
        raise HTTPException(status_code=500, detail="Error al obtener el personaje.")


@app.get("/sheet", response_class=HTMLResponse)
async def get_sheet(
    character_url: HttpUrl = "https://nivel20.com/s/yfv6zczc",
):
    """Basándose en un personaje de Nivel20, genera una plantilla HTML con la información del personaje."""
    try:
        ch = character.convert_to_character(character_url)
        sheet = character.create_sheet(ch)
        return HTMLResponse(content=sheet, status_code=200)
    except InvalidURL as e:
        raise HTTPException(status_code=400, detail=str(e))
    except ConvertCharacterError as e:
        logger.error(f"Error al convertir el personaje: {e}")
        return HTMLResponse(content=f"<h1>Error: {e}</h1>", status_code=500)
    except Exception as e:
        logger.error(f"Error al obtener el personaje: {e}")
        return HTMLResponse(content="<h1>Error en el servidor.</h1>", status_code=500)


if __name__ == "__main__":
    uvicorn.run(
        "app:app",
        host=config.Application.host,
        port=config.Application.port,
        reload=True,
    )
