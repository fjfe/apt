<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>

      <head>
        <title>Provincias…</title>
        <link id="ico" rel="icon" href="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 48 48' stroke='%23777' stroke-width='4' fill='none'%3E%3Cpath d='M42 39V9c0-2-1-3-3-3H9C7 6 6 7 6 9v30c0 2 1 3 3 3h30c2 0 3-1 3-3zM42 13H6M31 40V12'/%3E%3C/svg%3E" />

        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          :root {          /* Altura dinámica:   cabecera + contenido  =  todo el alto de la ventana */
              --alt-tod:      100vh;
              --alt-cab:      3.5rem;
              --alt-con:      calc(var(--alt-tod) - var(--alt-cab));
          }
          body            { margin: 0; font-family: Verdana,Arial,sans-serif; background-color: #333; color: #fff; }
          h2              { margin: 0; font-size: 1.8rem; text-align: center;
                            height: var(--alt-cab); padding: .5rem 1rem; background-color: #ffccaa44; 
                            white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
          a               { text-decoration: none; cursor: pointer; color: #11f; }
          summary         { font-weight: bolder; cursor: pointer; }
          .clf:after      { content: ""; display: table; clear: both; }
          .fld            { float: right; }
          .fli            { float: left; }
          .icc            { height: 1em; width: auto; vertical-align: middle; border: none; }
          .icg            { height: 1em; width: 1em;  vertical-align: middle; }
          .ocu            { display: none; }
          .mam            { background-color: #ffa; }
          .peq            { font-size: 80%; }
          .ver            { color: #0b4; }
          .uni            { white-space: nowrap; }
          .conte          { height: var(--alt-con); width: 98%; margin: 0 1rem; }
          .arbol          { height: var(--alt-con); width: 35%; overflow: auto; padding-right: .5rem; }
          .artic          { height: var(--alt-con); width: 64%; float: left; padding: .5rem; }
          .pais           { margin: .5em 0; }
          .pais > summary { background-color: #efffe799; }
          .prov           { margin: .3em 0 .3em 1em; }
          .prov > summary { background-color: #efe7ff99; }
          .deta           { margin: 0 0 0 1em; }

          details > summary {
            list-style-type: ' ⮞ ';
          }

          details[open] > summary {
            list-style-type: '  ‣  ';
          }
        </style>

        <svg class="ocu">
          <defs>
            <symbol id="ico_flecha_desple" viewBox="0 0 512 512" fill="currentColor">
              <path d="m322.04 503.79 152-176c13-16 3-40-18-40h-80c-2-161-34-288-186-288-62 0-123 40-154 83-10 14 2 33 18 28 145-45 184 22 186 177h-88c-21 0-31 24-18 40l152 176c9 11 27 11 36 0z"/>
            </symbol>
            <symbol id="ico_flecha_plegar" viewBox="0 0 512 512" fill="currentColor">
              <path d="m322.04 8.0449 152 176c13 16 3 40-18 40h-80c-2 161-34 288-186 288-62 0-123-40-154-83-10-14 2-33 18-28 145 45 184-22 186-177h-88c-21 0-31-24-18-40l152-176c9-11 27-11 36 0z"/>
            </symbol>
            <symbol id="ico_hoja_vacia" viewBox="0 0 96 96" fill="currentColor">
              <path fill="#000" d="M61 8H18.3c-.7 0-1.3.6-1.3 1.3v77.4c0 .7.6 1.3 1.3 1.3H78c.7 0 1.2-.6 1.2-1.3V26.3a3 3 0 0 0-.8-2.1L63 8.9A3 3 0 0 0 61 8z"/><path fill="#979593" d="M79.1 24.7 61.3 7a3 3 0 0 0-2.1-.9H19a3 3 0 0 0-3 3v78a3 3 0 0 0 3 3h58a3 3 0 0 0 3-3V26.8a3 3 0 0 0-.9-2zM60 8.4 77.6 26H61a1 1 0 0 1-1-1V8.4zM77 88H19a1 1 0 0 1-1-1V9c0-.6.4-1 1-1h39v17a3 3 0 0 0 3 3h17v59c0 .6-.4 1-1 1z"/>
            </symbol>
            <symbol id="ico_btn_mas" viewBox="0 0 512 512" fill="currentColor">
              <path d="m96 32c-35 0-64 29-64 64v320c0 35 29 64 64 64h320c35 0 64-29 64-64v-320c0-35-29-64-64-64h-320zm136 312v-64h-64c-13 0-24-11-24-24s11-24 24-24h64v-64c0-13 11-24 24-24s24 11 24 24v64h64c13 0 24 11 24 24s-11 24-24 24h-64v64c0 13-11 24-24 24s-24-11-24-24z"/>
            </symbol>
            <symbol id="ico_wikipedia" viewBox="0 0 20 20" fill="currentColor">
              <path d="M11.14 4H14a.69.69 0 0 1 0 .65c-1 .16-1.36.91-1.81 1.83l-1.4 2.75 2.35 5.21h.07l3.52-8.1c.44-1.07.4-1.59-.79-1.7a.68.68 0 0 1 0-.65h3.45a.68.68 0 0 1 0 .65c-1.21.16-1.42.91-1.81 1.83l-4.37 10.08c-.13.3-.24.45-.44.45s-.33-.16-.42-.45l-2.48-5.73-2.72 5.73c-.11.3-.24.45-.44.45s-.31-.16-.42-.45l-4-10.09c-.57-1.4-.6-1.7-1.65-1.8A.68.68 0 0 1 .62 4h3.91a.68.68 0 0 1 0 .65c-1.16.13-1.21.45-.74 1.58l3.41 8.19h.05L9.3 10 7.78 6.45C7.17 5.05 7 4.77 6.24 4.66a.69.69 0 0 1 0-.65h3.32a.68.68 0 0 1 0 .65c-.74.12-.7.45-.19 1.58l.87 2 .08.09 1-2c.57-1.14.64-1.58-.15-1.7a.69.69 0 0 1-.03-.63z"/>
            </symbol>
            <symbol id="ico_escudo" viewBox="0 0 512 512" fill="currentColor">
              <path d="m479 111a16 16 0 0 0-13-14c-86-16-122-28-200-63-8-3-13-3-20 0-78 35-114 47-200 63a16 16 0 0 0-13 14c-4 61 4 118 24 170a349 349 0 0 0 72 112c44 47 94 75 119 86a20 20 0 0 0 16 0c27-11 74-38 119-86a349 349 0 0 0 72-112c20-52 28-109 24-170z"/>
            </symbol>
          </defs>
        </svg>
      </head>

      <body>
        <h2 id="ti2" class="clf"> <!-- Lo rellena JS --></h2>   <!-- Uso H2 en lugar de H1, para incrustarlo en otras páginas -->

        <div class="conte">

          <div class="artic"><!-- JS: Solo uno de sus hijos se hará visible -->
            <div id="art" class="ocu"></div>
            <iframe id="ifr" class="ocu" width="100%" height="100%" frameBorder="0" src="about:blank"></iframe>
          </div>

          <div class="arbol">
            <xsl:for-each select="paises/país">
              <details open="" class="pais">
                <summary><xsl:value-of select="nombre" /></summary>
                <div>
                  <xsl:for-each select="provincia">
                    <details class="prov">
                      <summary><xsl:value-of select="nombre" /></summary>
                      <div class="deta">
                        <table>
                          <tr><td>Superficie: </td><td><xsl:value-of select="superficie" /> Km<sup><small>2</small></sup></td></tr>
                          <tr><td>Población:  </td><td><xsl:value-of select="población" /> hab.</td></tr>
                          <tr>
                            <td>Densidad:</td>
                            <td>
                              <xsl:variable name="n_sup" select="superficie" />
                              <xsl:variable name="n_pob" select="población" />
                              <xsl:value-of select="floor(($n_pob div $n_sup) * 100 ) div 100"/> hab/Km<sup><small>2</small></sup>
                            </td>
                          </tr>
                          <tr>
                            <td>Enlaces:</td>
                            <td>
                              <xsl:variable name="str_htm" select="art" />
                              <xsl:variable name="url_web" select="web" />
                              <xsl:variable name="url_wiki" select="wiki" />
                              <a class="uni" onclick="art_htm('{$str_htm}')" title="Texto HTML"
                                ><svg class="icg"><use href="#ico_btn_mas" /></svg></a> 
                              <a class="uni" onclick="art_url('{$url_wiki}')"
                                ><svg class="icg"><use href="#ico_wikipedia" /></svg><small>ikipedia</small></a> 
                              <a class="uni" onclick="art_url('{$url_web}')" title="Diputación"
                                ><svg class="icg"><use href="#ico_escudo" /></svg><small> <xsl:value-of select="@id" /></small></a>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </details>
                  </xsl:for-each>
                </div>
              </details>
            </xsl:for-each>
          </div>

        </div>

      </body>

      <script>
        function e(s){return document.getElementById(s);}
        function qs(s){return document.querySelectorAll(s);}
        function art_htm(s){
          e('art').classList.remove('ocu');
          e('ifr').classList.add('ocu');
          e('art').innerHTML = s;
        }
        function art_url(url){
          e('art').classList.add('ocu');
          e('ifr').classList.remove('ocu');
          e('ifr').setAttribute('src', url);
        }
        function main(){  // ----------------------------------------------------------------------
          e('tit').innerHTML = document.title +
                               '<div class="fli peq">' +
                               '  <a id="vacio" title="vacío"><svg class="icg"><use href="#ico_hoja_vacia" /></svg></a>' +
                               '</div>' +
                               '<div class="fld peq">' +
                               '  <a id="desple" title="desplegar todo"><svg class="icg"><use href="#ico_flecha_desple" /></svg></a> ' +
                               '  <a id="plegar" title="plegar todo"><svg class="icg"><use href="#ico_flecha_plegar" /></svg></a>' +
                               '</div>';
          e('desple').onclick = ()=>{ qs('details').forEach(u=>{u.setAttribute('open', '')}); }
          e('plegar').onclick = ()=>{ qs('details').forEach(u=>{u.removeAttribute('open')}); }
          e('vacio').onclick  = ()=>{ art_htm(''); }
        }
        window.addEventListener('load', main);
      </script>

    </html>
  </xsl:template>
</xsl:stylesheet>
