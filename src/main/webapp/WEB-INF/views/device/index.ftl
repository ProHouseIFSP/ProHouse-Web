<@content for="title">Dispositivos</@content>

<div class="message"><@flash name="message"/></div>

<@link_to action="new_form">Add new book</@link_to>

<table>
    <tr>
        <td>Title</td>
        <td>Author</td>
        <td>Edit</td>
    </tr>
<#list devices as device>
    <tr>
        <td>
            <@link_to action="show" id=device.id>${book.title}</@link_to>
        </td>
        <td>
            ${device.nome}</td>
        <td>
            <@form  id=device.id action="delete" method="delete" html_id=device.id >
                <button type="submit">delete</button>
            </@form>
        </td>
    </tr>
</#list>
</table>




