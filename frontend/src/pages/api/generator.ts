import type { APIRoute } from 'astro'
import { Application } from '../../config';


export const GET: APIRoute = async ({ request }) => {
    const url = new URL(request.url);
    const characterUrl = url.searchParams.get('character_url');
    const response = await fetch(Application.generatorAPIURL + `/sheet?character_url=${characterUrl}`,
        {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        },
    );
    if (!response.ok) {
        const errorData = await response.json();
        return new Response(
            JSON.stringify({ error: errorData?.detail || 'Error fetching data' }),
            { status: response.status, headers: { 'Content-Type': 'application/json' } }
        );
    }

    const html = await response.text();
    return new Response(html, { status: 200, headers: { 'Content-Type': 'text/html' } });
}

