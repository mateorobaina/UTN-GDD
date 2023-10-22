# TP Gestión de Datos

## Información de grupo
Nombre de grupo -  **RADIUM**

Curso **K3673**

Numero de grupo **52**

Alumnos:
- **Juan Mateo Robaina**
    - Legajo **1714995**
    - Mail **juan.robaina@jpmchase.com**
- **Matias Coarasa**
    - Legajo **1642078**
    - Email **mcoarasa@frba.utn.edu.ar**


## Prerrequisitos
1. Docker instalado
2. Powershell instalado

## ¿Cómo levantar BD y ejecutar script?
1. Iniciar una terminal de Powershell
2. Setear la variable de ambiente `DB_PWD` con el comando `Set-Variable -Name "DB_PWD" -Value "{PASSWORD}"`
3. Asegurarse que está corriendo el *daemon* de Docker 
4. Ejecutar script `.\start-db.ps1`

> Si se intenta ejecutar el script con el contenedor de Docker existente, va a fallar. En ese caso ejecutar `docker start sqlserver2019`.
