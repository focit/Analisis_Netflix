/*
13. Pregunta: ¿Qué porcentaje del contenido con bajo desempeño (menos horas vistas) está disponible mundialmente?
- Filtrar la tabla para que se muestren solamente los títulos con horas vistas menor a 1000000 que se considerarán de bajo desempeño.
- Contabilizar el número de títulos.
- Obtener el porcentaje del contenido con bajo desempeño.
- Agrupar por su disponibilidad mundial.
¿Por qué? Determinar si invertir en disponibilidad global para ciertos títulos tiene un impacto positivo.
*/

SELECT 
    disponibilidad_mundial, 
    COUNT(*) AS Titulos_bajo_desempeño,
    ROUND((COUNT(*)*1.0/(SELECT COUNT(*) FROM netflix_content_2023 WHERE horas_vistas < 1000000)*1.0)*100,2) AS porcentaje
FROM netflix_content_2023
WHERE horas_vistas < 1000000
GROUP BY 1;

/*
Insights:
EL porcentaje con bajo desempeño que se encuentra disponible mundialmente es del 18.26%, mientras que los títulos con bajo desempeño
que no están disponibles mundialmente son el 81.74%. Lo que significa que es factible invertir en disponibilidad global para mejorar
el número de horas vistas hacia la programación de Netflix en 2023.

[
  {
    "disponibilidad_mundial": "No",
    "titulos_bajo_desempeño": "9722",
    "porcentaje": "81.74"
  },
  {
    "disponibilidad_mundial": "Yes",
    "titulos_bajo_desempeño": "2172",
    "porcentaje": "18.26"
  }
]
*/