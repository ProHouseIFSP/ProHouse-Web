<@content for="title">Equipamentos</@content>

<h2 class="title is-4">Equipamentos</h2>

<@link_to action="create" class="button is-info">Novo equipamento</@link_to>

<hr>
<div style="overflow-x: auto">
<table class="table is-stripped is-fullwidth">
    <thead>
        <tr>
            <th>Equipamento</th>
            <th>IP</th>
            <th>Estado</th>
            <th class="is-hidden-mobile" colspan="4">Ações</th>
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

            <td class="is-hidden-mobile" style="width: 10px">
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

            <td class="is-hidden-mobile" style="width: 10px">
                <@link_to action="show" id=device.id class="button is-info">
                    Programar horário
                </@link_to>
            </td>

            <td class="is-hidden-mobile" style="width: 10px">
                <@form id=device.id action="edit" method="get" html_id=device.id >
                    <button class="button is-warning" type="submit">Editar</button>
                </@form>
            </td>

            <td class="is-hidden-mobile" style="width: 10px">
                <@form id=device.id action="delete" method="delete" html_id=device.id >
                    <button class="button" type="submit">Deletar</button>
                </@form>
            </td>

            <tr class="is-hidden-tablet">
                <td style="width: 10px" colspan="3">
                    <div style="overflow-x: auto">
                        <#if (device.status == "1")>
                            <@form action="off" style="display: inline-block" method="post" id=device.id html_id=device.id>
                                <button class="button is-small is-danger" type="submit">Desligar</button>
                            </@form>
                        <#else/>
                            <@form action="on" style="display: inline-block" method="post" id=device.id html_id=device.id>
                                <button class="button is-small is-success" type="submit">Ligar</button>
                            </@form>
                        </#if>

                        <@form id=device.id action="show" style="display: inline-block" method="get" html_id=device.id >
                            <button class="button is-small is-info" type="submit">Horários</button>
                        </@form>
                    
                        <@form id=device.id action="edit" style="display: inline-block" method="get" html_id=device.id >
                            <button class="button is-small is-warning" type="submit">Editar</button>
                        </@form>
                    
                        <@form id=device.id action="delete" style="display: inline-block" method="delete" html_id=device.id >
                            <button class="button is-small" type="submit">Deletar</button>
                        </@form>
                    </div>
                </td>
            </tr>
        </tr>
    </#list>
    </tbody>
</table>
</div>




