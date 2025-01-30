/*
4. Pregunta: ¿Cuál es la combinación entre el tipo de contenido y el idioma que más horas vistas tiene?
- Sumar el total de horas vistas.
- Agruparlo por idioma y tipo de contenido.
¿Por qué? Analizar si la distribución de las horas vistas por idioma cambia según el tipo de contenido en los
usuarios de Netflix en 2023.
*/

SELECT
tipo_de_contenido,
idioma,
SUM(horas_vistas) AS total_de_horas
FROM netflix_content_2023
GROUP BY 1,2
ORDER BY 3 DESC;

/*
Insights:
Los consumidores en 2023 prefirieron las Series en Inglés con un total de 88,140,800,000 horas, seguidas por Pelícuas en Inglés con
36,300,900,000 horas, en tercer lugar se encuentran las Series en idioma Coreano con 7,792,600,000 horas.
La combinación más preferida por los usuarios de Netflix en 2023 fueron las Series en Inglés.

[
  {
    "tipo_de_contenido": "Show",
    "idioma": "English",
    "total_de_horas": "88140800000"
  },
  {
    "tipo_de_contenido": "Movie",
    "idioma": "English",
    "total_de_horas": "36300900000"
  },
  {
    "tipo_de_contenido": "Show",
    "idioma": "Korean",
    "total_de_horas": "7792600000"
  },
  {
    "tipo_de_contenido": "Movie",
    "idioma": "Korean",
    "total_de_horas": "7585800000"
  },
  {
    "tipo_de_contenido": "Show",
    "idioma": "Non-English",
    "total_de_horas": "6847600000"
  },
  {
    "tipo_de_contenido": "Show",
    "idioma": "Japanese",
    "total_de_horas": "4572500000"
  },
  {
    "tipo_de_contenido": "Movie",
    "idioma": "Non-English",
    "total_de_horas": "3591500000"
  },
  {
    "tipo_de_contenido": "Movie",
    "idioma": "Japanese",
    "total_de_horas": "2529500000"
  },
  {
    "tipo_de_contenido": "Movie",
    "idioma": "Hindi",
    "total_de_horas": "604900000"
  },
  {
    "tipo_de_contenido": "Show",
    "idioma": "Hindi",
    "total_de_horas": "321200000"
  },
  {
    "tipo_de_contenido": "Show",
    "idioma": "Russian",
    "total_de_horas": "89400000"
  },
  {
    "tipo_de_contenido": "Movie",
    "idioma": "Russian",
    "total_de_horas": "25200000"
  }
]
*/
