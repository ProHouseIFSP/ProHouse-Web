<@content for="title">Login</@content>
   <@flash name="pass">
        <div class="notification is-info"><@flash name="pass"/></div>
    </@flash>
    
<@form method="post" action="commonLogin">
	
	<div class="field">
    	<label class="label">Nome de Usuário</label>
		<div class="control">
			<input class="input" name="username"/>
		</div>
	</div>
	
	<div class="field">
    	<label class="label">Senha</label>
		<div class="control">
			<input name="password" type="password" class="input">
		</div>
	</div>

	<button class="button is-info">Entrar</button>
	
</@form>
