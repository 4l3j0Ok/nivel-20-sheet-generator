class Nivel20APIError(Exception):
    """Excepción personalizada para errores de la API de Nivel20."""

    pass


class ConvertCharacterError(Exception):
    """Excepción personalizada para errores al convertir un personaje."""

    pass


class InvalidURL(Exception):
    """Excepción personalizada para URLs inválidas."""

    def __str__(self):
        return "URL inválida. Debe ser una URL de Nivel20."
