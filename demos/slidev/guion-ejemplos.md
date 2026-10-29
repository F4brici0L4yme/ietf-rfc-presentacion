# Guion de 2 minutos — Ejemplos populares

**Slide:** “Dónde está el RFC en tu día” (slide 12 de la demo Slidev).

## Objetivo
Que la clase entienda que los RFC no son documentos lejanos: son las reglas que
hacen funcionar lo que usan todos los días. La idea es mostrar **tres protocolos
en cadena** y demostrar dominio con una demo real.

## Guion

### 0:00–0:15 — Enganche
> “¿Cuántos de ustedes usaron Internet hoy? Probablemente todos. Ahora, ¿qué pasa
> exactamente cuando abren una página? No es magia: son varios RFC trabajando en
> cadena.”

*Señala la slide y deja que la clase levante la mano.*

### 0:15–0:45 — DNS
> “Primero, el navegador necesita saber dónde está el servidor. Ahí entra DNS,
> el RFC 1034: traduce un nombre como `unsa.edu.pe` en una dirección IP. Sin DNS
> tendríamos que memorizar números.”

*Señala la tarjeta DNS. Si tienes terminal:*
```bash
nslookup unsa.edu.pe
```
> “Eso que aparece abajo es la respuesta DNS: el nombre se convirtió en una IP.”

### 0:45–1:10 — TCP
> “Con la IP, el navegador abre una conexión. TCP, el RFC 9293, divide los datos
> en segmentos, los numera, confirma lo recibido y reenvía lo que se pierde. Por
> eso una descarga no se corrompe aunque la red falle.”

*Señala la tarjeta TCP.*

### 1:10–1:35 — HTTP
> “Ya hay conexión; falta pedir el contenido. HTTP, el RFC 9110, define métodos,
> códigos de estado y encabezados. Cuando ven un 404 o un 200, están viendo HTTP
> en acción.”

*Señala la tarjeta HTTP. Pregunta rápida:*
> “¿Un 404 es un error de red? No: la red funcionó; el servidor respondió que el
> recurso no existe.”

### 1:35–1:50 — Profundidad
> “Y esto no es estático: el RFC 9293 reemplazó al histórico 793; el 9110
> actualizó al 2616. Los RFC se actualizan, se obsoletizan y tienen erratas. Por
> eso siempre hay que revisar el estado y la vigencia.”

*Si tienes abierto el RFC 9293, muestra la cabecera “Obsoletes RFC 793”.*

### 1:50–2:00 — Cierre
> “En dos minutos vimos DNS, TCP y HTTP: tres RFC que usan todos los días.
> Entenderlos es la diferencia entre usar Internet y diseñar sistemas que
> funcionan en Internet.”

## Demo en vivo (la que más impresiona)

### Opción A — DevTools del navegador
1. Abre una página cualquiera.
2. `F12` → **Network** → marca **Disable cache** → recarga.
3. Muestra las filas: **DNS lookup**, **Initial connection**, **TLS**, **Request**.
4. Di: “Cada fila corresponde a una capa y a un RFC distinto”.

### Opción B — `curl -v` en terminal
```bash
curl -v https://www.unsa.edu.pe
```
Qué señalar:
- `Trying ...` → resolución y conexión.
- `Connected to ...` → TCP.
- `TLS handshake` → seguridad.
- `> GET / HTTP/1.1` → petición HTTP.
- `< HTTP/1.1 200 OK` → respuesta HTTP.

### Opción C — Abrir los RFC en el navegador
- RFC 1034: https://www.rfc-editor.org/rfc/rfc1034
- RFC 9293: https://www.rfc-editor.org/rfc/rfc9293
- RFC 9110: https://www.rfc-editor.org/rfc/rfc9110

Muestra en cada uno:
- El **stream** y el **status** en la cabecera.
- La línea **Obsoletes / Updates**.
- La sección **Security Considerations**.
- Busca `MUST` o `SHOULD` y explica que no son sinónimos.

## Cómo demostrar que dominas el tema
1. **No leas la slide:** úsala solo para señalar los protocolos.
2. **Usa los números correctos:** DNS 1034, TCP 9293, HTTP 9110.
3. **Explica la evolución:** 793 → 9293; 2616 → 9110.
4. **Distingue estado y vigencia:** no todo RFC es estándar; revisa `Obsoletes` y `Updates`.
5. **Haz una pregunta de diagnóstico:** “¿Un 404 es fallo de red o respuesta de la aplicación?”.
6. **Cierra con una idea transferible:** “El RFC es el contrato técnico entre sistemas”.

## Plan B si falla Internet
- Deja las tres pestañas de RFC abiertas antes de exponer.
- Ten una terminal con `curl -v` ya ejecutado y el output visible.
- Ten capturas locales de las cabeceras de los RFC.
- Si no hay proyector para terminal, usa la slide y explica el orden DNS → TCP → HTTP con las tarjetas.

## Frases de respaldo
- “Un RFC no es una sugerencia: es el contrato que dos implementaciones deben cumplir para interoperar.”
- “El número más alto no siempre es el correcto; hay que mirar actualizaciones y obsolescencias.”
- “Sin RFC no hay interoperabilidad: cada fabricante inventaría su propio protocolo.”
