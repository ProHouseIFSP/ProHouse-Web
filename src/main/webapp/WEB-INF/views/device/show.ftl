<@content for="title">Equipamento: ${equipamento.nome}</@content>

<h2 class="title is-4">Detalhes do equipamento</h2>

<p><strong>Nome:</strong> ${equipamento.nome}</p>
<p><strong>IP:</strong> ${equipamento.ip}</p>

<br>
<h1 class="title is-5">Horários programados</h1>

<ul>
    <#if horarios??>
        <#list horarios as horario>
        <li>
            <@form id=equipamento.id action="deleteCron" method="delete" html_id=horario.id>
            ► <button name="cron" value="${horario.id}" type="submit" class="button is-danger is-small">X</button>
            ${horario.horario}
            </@form>
        </li>
        </#list>
    <#else>
        <li> ► Nenhum horário programado</li>
    </#if>
    
    <li>
        <@form id=equipamento.id action="saveCron" method="post" html_id=equipamento.id>
            <div class="columns">
                <div class="column is-2">
                    <div class="control">
                        <input name="time" type="time" class="input">
                    </div>
                </div>
                <div class="column is-2">
                    <button class="button is-success" type="submit">+</button>
                </div>
            </div>
        </@form>
    </li>
</ul>

