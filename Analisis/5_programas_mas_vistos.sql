/*
5. Pregunta: ¿Cuáles son los 10 programas que los usuarios de Netflix prefirieron en 2023?
- Sumar el total de horas vistas y agruparlas por idioma.
- Ver el porcentaje de diferencia que hay en cada uno de los idiomas.
¿Por qué? Conocer cuáles fueron las series más populares en Netflix en 2023.
*/

SELECT
titulo,
horas_vistas
FROM netflix_content_2023
ORDER BY 2 DESC
LIMIT 10;

/*
Insights:
En el Top 10 de títulos más consumidos en Netflix en 2023 podemos observar que las Series (presentes en 8 lugares) y el Inglés
(presentes en 7) tienen una mayor presencia que los demás.

[
  {
    "titulo": "The Night Agent: Season 1",
    "horas_vistas": 812100000
  },
  {
    "titulo": "Ginny & Georgia: Season 2",
    "horas_vistas": 665100000
  },
  {
    "titulo": "King the Land: Limited Series // 킹더랜드: 리미티드 시리즈",
    "horas_vistas": 630200000
  },
  {
    "titulo": "The Glory: Season 1 // 더 글로리: 시즌 1",
    "horas_vistas": 622800000
  },
  {
    "titulo": "ONE PIECE: Season 1",
    "horas_vistas": 541900000
  },
  {
    "titulo": "Wednesday: Season 1",
    "horas_vistas": 507700000
  },
  {
    "titulo": "Queen Charlotte: A Bridgerton Story",
    "horas_vistas": 503000000
  },
  {
    "titulo": "You: Season 4",
    "horas_vistas": 440600000
  },
  {
    "titulo": "La Reina del Sur: Season 3",
    "horas_vistas": 429600000
  },
  {
    "titulo": "Outer Banks: Season 3",
    "horas_vistas": 402500000
  }
]
*/