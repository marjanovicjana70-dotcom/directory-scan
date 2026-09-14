<h1>  ------------------------------ DIRECTORY SCAN ------------------------------ <h4 style="letter-spacing: 3px;color:red;">Napravljeno je za linux distribuciju i za one koji koriste bash kao izabrani shell</h4></h1>

<hr>
<h3 style="letter-spacing: 3px;">Prvo posto tree komanda nije preinstalirana morate je instalirati uz pomoc:</h3>

```
sudo apt install tree
```
(Ako koristite Ubuntu/Debian/Mint)


<hr>

<h3 style="letter-spacing: 3px;">Sledece, da bi ova skripta radila morate je prebaciti u /local/bin. Za to vec postoji skripta pa cete samo uneti u komandnu liniju:</h3>
<br>

```
bash move.sh
```
<hr>

<h3 style="letter-spacing: 3px;">I to je to sada mozete pokrenuti skriptu</h3>

```
bash scan.sh
```
<h3 style="letter-spacing: 3px;">Directory scan, mali interaktivni UI, mozete koristi za prikaz foldera brisanja pravljenje novih foldera/fajlova mozete izlaziti iz foldera ulaziti u foldere, mozete naci stare fajlove, duplikate, velike fajlove. Isto tako u kodu mozete samo promeniti default postavljene vrednost prema vasem kriterijumu (sto se tice filtriranje fajlova po X velicini ili po top Y najvecih fajlova)..</h3>