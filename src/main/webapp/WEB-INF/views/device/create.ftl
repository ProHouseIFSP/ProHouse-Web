<@content for="title">Novo equipamento</@content>

<@form id=(equipamento.id)!null action="save" method="post" class="main-form">

    <#if (equipamento)??>
        <h2 class="title is-4">Editar Equipamento</h2>
    <#else>
        <h2 class="title is-4">Novo Equipamento</h2>
    </#if>

    <div class="field">
    <label class="label">Nome do equipamento</label>
    <div class="control">
        <input class="input" placeholder="eg: Cafeteira, TV, etc" name="nome" value="${(equipamento.nome)!(flasher.params.nome)!}">
    </div>
    </div>

    <div class="field">
    <label class="label">IP do equipamento</label>
    <div class="control">
        <input class="input" placeholder="eg: 10.10.117.110" name="ip" value="${(equipamento.ip)!(flasher.params.ip)!}">
    </div>
    </div>

    <div class="field is-grouped">
        <div class="control">
            <#if (equipamento)??>
                <button class="button is-link">Atualizar</button>
            <#else>
                <button class="button is-link">Cadastrar</button>
            </#if>
        </div>

        <div class="control">
            <@link_to class="button is-text">Cancelar</@link_to>
        </div>
    </div>
</@form>
