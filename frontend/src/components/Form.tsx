import { useState } from 'react';
import type { FormEvent } from 'react';
import { Icon } from '@iconify/react';
import '../styles/Form.css';

export default function Form() {
    const [characterUrl, setCharacterUrl] = useState<string>('');
    const [loading, setLoading] = useState<boolean>(false);
    const [error, setError] = useState<string>('');

    const handleSubmit = async (event: FormEvent) => {
        event.preventDefault();
        setLoading(true);
        setError('');

        try {
            const response = await fetch(`/api/generator?character_url=${encodeURIComponent(characterUrl)}`, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                },
            });

            setLoading(false);

            if (response.ok) {
                const html = await response.text();
                const newTab = window.open()
                newTab.document.open()
                newTab.document.write(html);
                newTab.document.close()
            } else {
                const errorData = await response.json().catch(() => null);
                console.log(errorData);
                const errorMessage = errorData?.detail[0]?.msg || errorData?.detail || "Error al generar la hoja de personaje";
                setError(errorMessage);
            }
        } catch (err) {
            setLoading(false);
            setError("Error de conexión al servidor");
        }
    };

    return (
        <>
            {loading && <Loader />}
            <div className="form-container">
                <form className="form" onSubmit={handleSubmit}>
                    <input
                        type="text"
                        placeholder="URL del personaje"
                        value={characterUrl}
                        onChange={(event) => setCharacterUrl(event.target.value)}
                        required
                    />
                    <button type="submit">Generar</button>
                </form>
                <div className="error-message">{error}</div>
            </div>
        </>
    );
}

function Loader() {
    return (
        <div className="loader">
            <div className="content">
                <Icon icon="fa-solid:dice-d20" className="dice-spinner" />
                <p>Generando hoja de personaje...</p>
            </div>
        </div>
    );
}