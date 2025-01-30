/*
3. Pregunta: ¿Es igual la distribución en el promedio que el total de horas vistas por idioma?
- Promediar la horas vistas.
- Agruparlas por idioma.
¿Por qué? Saber si se distribuyen el total de horas vistas y el promedio en la preferencia de idioma en los
usuarios de Netflix en 2023.
*/

SELECT 
  idioma, 
  ROUND(AVG(horas_vistas),2) AS Promedio_Horas_Vistas
FROM netflix_content_2023
GROUP BY 1
ORDER BY 2 DESC;

/*
Insigths:
No existe una distribución igual en el promedio. Porque, en el total de horas el Inglés fue el primer lugar, pero el Coreano
tiene un mayor promedio de horas vistas durante 2023. Lo que indica que el contenido en coreano tiene una mayor tasa de consumo 
por usuario o por título.


[
  {
    "idioma": "Korean",
    "promedio_horas_vistas": "9720859.67"
  },
  {
    "idioma": "English",
    "promedio_horas_vistas": "7206491.78"
  },
  {
    "idioma": "Non-English",
    "promedio_horas_vistas": "3210055.35"
  },
  {
    "idioma": "Japanese",
    "promedio_horas_vistas": "3091858.95"
  },
  {
    "idioma": "Russian",
    "promedio_horas_vistas": "2938461.54"
  },
  {
    "idioma": "Hindi",
    "promedio_horas_vistas": "2476203.21"
  }
]
*/