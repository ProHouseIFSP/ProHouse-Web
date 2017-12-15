<@content for="title">Novo equipamento</@content>

<@form action="save" method="post" class="main-form">

    <h2 class="title is-4">Novo Equipamento</h2>

    <div class="field">
    <label class="label">Nome do equipamento</label>
    <div class="control">
        <input class="input" placeholder="eg: Cafeteira, TV, etc" name="nome" value="${(flasher.params.nome)!}">
    </div>
    </div>

    <div class="field">
    <label class="label">IP do equipamento</label>
    <div class="control">
        <input class="input" placeholder="eg: 10.10.117.110" name="ip" value="${(flasher.params.ip)!}">
    </div>
    </div>

    <div class="field is-grouped">
        <div class="control">
            <button class="button is-link">Submit</button>
        </div>

        <div class="control">
            <@link_to class="button is-text">Cancel</@link_to>
        </div>
    </div>
</@form>
