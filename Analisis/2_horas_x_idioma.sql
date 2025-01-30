/*
2. Pregunta: ¿Cuál es el idioma con más horas vistas en valor absoluto y porcentaje en 2023?
- Sumar el total de horas vistas y agruparlas por idioma.
- Ver el porcentaje de diferencia que hay en cada uno de los idiomas.
¿Por qué? Conocer qué idioma tiene más preferencia entre los usuarios de Netflix en 2023.
*/

SELECT
idioma,
sum(horas_vistas) as total_de_horas,
ROUND((sum(horas_vistas) * 1.0 / (SELECT SUM(horas_vistas) * 1.0 FROM netflix_content_2023)) * 100,2) AS pct_de_horas
FROM netflix_content_2023
GROUP BY 1
ORDER BY 2 DESC;

/*
Insights:
El inglés fue el idioma más consumido en Netflix en 2023 con un 78.56%, esto significa que más de 3/4 partes del contenido visto 
fue en esta lengua. En segundo lugar está el idioma Coreano con un 9.71% y en tercer lugar la cetegoría de Otros idiomas con 6.59%.
Los idiomas menos vistos fueron el Indú y el Ruso.

[
  {
    "idioma": "English",
    "total_de_horas": "124441700000",
    "pct_de_horas": "78.56"
  },
  {
    "idioma": "Korean",
    "total_de_horas": "15378400000",
    "pct_de_horas": "9.71"
  },
  {
    "idioma": "Non-English",
    "total_de_horas": "10439100000",
    "pct_de_horas": "6.59"
  },
  {
    "idioma": "Japanese",
    "total_de_horas": "7102000000",
    "pct_de_horas": "4.48"
  },
  {
    "idioma": "Hindi",
    "total_de_horas": "926100000",
    "pct_de_horas": "0.58"
  },
  {
    "idioma": "Russian",
    "total_de_horas": "114600000",
    "pct_de_horas": "0.07"
  }
]
*/