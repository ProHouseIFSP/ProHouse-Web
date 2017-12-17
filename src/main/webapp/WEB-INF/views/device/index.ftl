<@content for="title">Equipamentos</@content>

<h2 class="title is-4">Equipamentos</h2>

<@link_to action="create" class="button is-info">Novo equipamento</@link_to>

<hr>

<table class="table is-stripped is-fullwidth">
    <thead>
        <tr>
            <th>Equipamento</th>
            <th>IP</th>
            <th>Estado</th>
            <th colspan="3">Ações</th>
        </tr>
    </thead>
    <tbody>
    <#list devices as device>
        <tr>
            <td style="width: 30%"><@link_to action="show" id=device.id>
                ${device.nome!"Sem nome"}
            </@link_to></td>

            <td>${device.ip!"Sem ip"}</td>

            <td>
                <#if (device.status == "1")>
                    Ligado
                <#else/>
                    Desligado
                </#if>        
            </td>

            <td style="width: 10px">
                <#if (device.status == "1")>
                    <@form action="off" method="post" id=device.id html_id=device.id>
                        <button class="button is-danger" type="submit">Desligar</button>
                    </@form>
                <#else/>
                    <@form action="on" method="post" id=device.id html_id=device.id>
                        <button class="button is-success" type="submit">Ligar</button>
                    </@form>
                </#if>        
            </td>

            <td style="width: 10px">
                <@form action="newCron" method="post">
                    <button class="button is-info" type="submit">Programar horário</button>
                </@form>
            </td>

            <td style="width: 10px">
                <@form id=device.id action="delete" method="delete" html_id=device.id >
                    <button class="button" type="submit">Deletar</button>
                </@form>
            </td>
        </tr>
    </#list>
    </tbody>
</table>




