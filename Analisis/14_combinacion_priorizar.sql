/*
14. Pregunta: ¿Qué combinación de idioma y tipo de contenido debería priorizarse para aumentar el engagement?
- Realizar una subconsulta para devolver una tabla con el título, idioma, tipo de contenido y unca columna que utiliza
CASE para dividir los programas con Alto desempeño o Bajo desempeño de acuerdo a las horas vistas.
- Contabilizar el número de títulos en la consulta principal.
- Agrupar por idioma, tipo de contenido y desempeño.
¿Por qué? Crear una estrategia para priorizar futuras producciones.
*/

SELECT
  idioma,
  tipo_de_contenido,
  desempeño,
  COUNT(titulo) AS total_titulos
FROM (
  SELECT
    titulo,
    idioma,
    tipo_de_contenido,
    CASE WHEN horas_vistas > 1000000 THEN 'Alto desempeño' ELSE 'Bajo desempeño' END AS desempeño
  FROM netflix_content_2023) AS a
WHERE desempeño = 'Alto desempeño'
GROUP BY 1,2,3
ORDER BY 4 DESC;

/*
Insights:
La combinación Series en Inglés, No ingles, Japonés y Coreano tiene un alto engagement así que se debe invertir en la producción de 
nuevas series en esos idiomas. En cuanto a las películas, hay oportunidades en películas inglésas, coreanas, japoneas y no inglesas.

[
  {
    "idioma": "English",
    "tipo_de_contenido": "Show",
    "desempeño": "Alto desempeño",
    "total_titulos": "5625"
  },
  {
    "idioma": "English",
    "tipo_de_contenido": "Movie",
    "desempeño": "Alto desempeño",
    "total_titulos": "3823"
  },
  {
    "idioma": "Non-English",
    "tipo_de_contenido": "Show",
    "desempeño": "Alto desempeño",
    "total_titulos": "619"
  },
  {
    "idioma": "Japanese",
    "tipo_de_contenido": "Show",
    "desempeño": "Alto desempeño",
    "total_titulos": "552"
  },
  {
    "idioma": "Korean",
    "tipo_de_contenido": "Show",
    "desempeño": "Alto desempeño",
    "total_titulos": "479"
  },
  {
    "idioma": "Non-English",
    "tipo_de_contenido": "Movie",
    "desempeño": "Alto desempeño",
    "total_titulos": "465"
  },
  {
    "idioma": "Korean",
    "tipo_de_contenido": "Movie",
    "desempeño": "Alto desempeño",
    "total_titulos": "408"
  },
  {
    "idioma": "Japanese",
    "tipo_de_contenido": "Movie",
    "desempeño": "Alto desempeño",
    "total_titulos": "320"
  },
  {
    "idioma": "Hindi",
    "tipo_de_contenido": "Movie",
    "desempeño": "Alto desempeño",
    "total_titulos": "109"
  },
  {
    "idioma": "Hindi",
    "tipo_de_contenido": "Show",
    "desempeño": "Alto desempeño",
    "total_titulos": "46"
  },
  {
    "idioma": "Russian",
    "tipo_de_contenido": "Show",
    "desempeño": "Alto desempeño",
    "total_titulos": "6"
  },
  {
    "idioma": "Russian",
    "tipo_de_contenido": "Movie",
    "desempeño": "Alto desempeño",
    "total_titulos": "5"
  }
]
*/