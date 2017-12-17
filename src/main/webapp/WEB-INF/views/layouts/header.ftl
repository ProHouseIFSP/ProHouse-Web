<section class="hero is-info is-hidden-mobile">
  <div class="hero-body">
    <div class="container is-fluid">
      <h1 class="title">
        <a href="${context_path}">ProHouse Web</a>
      </h1>
      <h2 class="subtitle">
        Controle todos seus equipamentos de um único lugar!
      </h2>
    </div>
  </div>
</section>

<section class="is-hidden-tablet">
    <h2 class="title is-5 notification is-info">
        <a href="${context_path}" style="text-decoration: none">ProHouse Web</a>
    </h2>
</section>


<#if (session.user) ??>
    <nav class="navbar" style="box-shadow: 0 2px 3px 0px rgba(0,0,0,.2)">
        <div class="navbar-menu container">
            <div class="navbar-start">
                <a class="navbar-item" href="#">Equipamentos</a>
            </div>
            
            <div class="navbar-end">
                <a class="navbar-item">Sair</a>
            </div>
        </div>
    </nav>
</#if>