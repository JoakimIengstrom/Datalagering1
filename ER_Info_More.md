# Datalagring del 1

Länk till **[Github](https://github.com/JoakimIengstrom/Datalagring-inl-mningsuppgift1)**

---

### Krav

## Scenario

Ett bra sätt att lära sig nya saker är genom att försöka kopiera det som redan finns.
I denna kursen ska vi utgå i från [Karma](https://www.karma.life/)s affärsidé om
att underlätta försäljning av lunchlådor som nått sitt bästföre datum. Vår tjänst kommer
att heta food-rescue.

Vad detta innebär som minimum, är att vi i vår databas måste hålla koll på **användare**,
de **restauranger** vi sammarbetar med och vilka **matlådor** som finns ute till försäljning
_just nu_.

Det kommer att finnas tre olika typer av användare som vill interagera med våran tjänst.

1. Kunden som loggar in på vår app och väljer en matlåda att köpa ur en sorterad lista av
   möjliga alternativ. Denne användare är vår primära inkomstkälla.
2. Servitör på restaurangen. Denne lägger dagligen till nya matlådor som blivit över
   under restaurangens namn.
3. Adminisitrativ personal som vi själva anställer. Dessa sköter tilläggning av nya
   restauranger som vi slutit kontrakt med.

## Uppdrag

Du ska skapa en relationsdatabas i **SQL Server**. Databasen ska planeras och designas med ER-diagram
utifrån ovanstående scenario. Sedan ska du skriva fyra SQL filer.

1. "diagram.pdf"
   - ett diagram på alla tabeller (kunder, restauranger och matpaket) och deras förhållanden

   - ska vara normaliserad till tredje graden

![ER-Klar](https://user-images.githubusercontent.com/89445183/140033140-b5843125-63e5-4e0c-9d3d-862e2a37e439.png)

2. "model.sql"
   - ska kunna köras för att skapa hela databasen enligt diagrammet och ska även fylla databasen med testdata
   - ska kunna köras flera gånger om utan att man behöver ta bort databasen emellanåt
3. "user.sql"
   - en query för att hitta alla oköpta matlådor i alla restauranger av en viss typ (kött/fisk/vego), sorterade på pris lägst först: ORDER BY, INNER JOIN
   - en query för att modifiera en lunchlådas användar ID från NULL till ID:t på en användare som köper en låda
4. "restaurant.sql"
   - en query för att se alla sålda matlådor för en restaurang
   - en query för att lägga till nya matlådor, kopplade till den aktuella restaurangen
5. "admin.sql"
   - en rutin för att kunna radera (banna) en användare
   - en rutin för att registrera en ny restaurang

Fil 3 till 5 representerar tre olika användarperspektiv, tre olika typer av användare som vill
interagera med din databas.

### G krav:

Planering:

- Databasen ska planeras med diagram (ER/RS) (pdf/png/jpg)
- Databasen skall vara normaliserad till tredje graden (N3)
- One to many etc. ska framgå (1:1, 0-1:M, 1:M, N:M)
- Det ska finnas minst tre tabeller: kunder, restauranger och matpaket
- Det ska finnas kopplingar mellan tabellerna där det passar: kunder<->matpaket, restauranger<->matpaket

Model:

- Tabeller ska skapas i SQL från den planerade databasen: CREATE DATABASE, CREATE TABLE, USE
- Testdata ska seedas in: INSERT INTO.. VALUES..
- Kopplingar ska skapas: PRIMARY KEY, FOREIGN KEY

Query:

- "user.sql"
  - en query för att hitta alla matlådor i alla restauranger av en viss typ (kött/fisk/vego), sorterade på pris lägst först
  - en query för att modifiera en lunchlådas användar ID från NULL till ID:t på en användare som köper en låda
- "restaurant.sql"
  - en query för att se alla sålda matlådor för en restaurang
  - en query för att lägga till nya matlådor, kopplade till den aktuella restaurangen
- "admin.sql"
  - en rutin för att kunna radera (banna) en användare
  - en rutin för att registrera en ny restaurang
- Kommentera koden! Vad för query ställs till databasen, alltså vilken information önskar man få ut?

### VG krav:

- Använd mer än tre tabeller. Alla tidigare regler om normalisering etc. gäller fortfarande.
  (Till exemepel: en tabell för köpta matlådor kunder<->köp, köp<->matlåda)
- Utöka följdaktigen med relevanta queries (Till exempel: lista på alla osålda matlådor, köphistorik för en användare, total förtjänst för en restaurang senaste måndaden)

### Deadline:

#1: lämnas in senast Fredag 05/11-21 kl 23.55 i PingPong.  
#2: lämnas in senast Fredag 19/11-21 kl 23.55 i PingPong.

### Inlämning

- PR till inlämningsrepon
- PingPong:
  - En zip av repon
  - Länk till PR på GitHub

---
