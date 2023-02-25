<!---Запрет перехода на страницу через url, если пользователь не залогинился--->
<cfif NOT isUserLoggedIn()>
  <cflocation url="login.cfm?noaccess" >
</cfif>


<cfif isDefined(URL.id)>

</cfif>
  <cfquery name="errorHistory">
    SELECT * FROM error_history, action, user
    WHERE error_history.id_action = action.id_action AND
    error_history.id_user = user.id_user
    ORDER BY error_history.date ASC
  </cfquery>

<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='testing.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='header.css'>
  <script src='main.js'></script>
</head>
<body>
  <header class="header">
    <nav class="header__box">
      <ul class="header__list">
        <li class="header__item">
          <a class="header__link " href="errorList.cfm">Назад</a>
        </li>
      </ul>
    </nav>
  </header>
  <main>
    <h1>История действий над ошибкой id:  </h1>
    <!---<cfoutput query="errorHistory"><p>#errorHistory.id_error#</p></cfoutput>--->
      <cfoutput  query="errorHistory">
          #errorHistory.id_error#
          
          
          
          
          <br/>
      </cfoutput>
    <table>
      <thead>
        <tr>
          <th>Дата</th>
          <th>Действие</th>
          <th>Комментарий</th>
          <th>Пользователь</th>
        </tr>
      </thead>
      <tbody>
        <cfoutput  query="errorHistory">
          <tr>
            <td>#errorHistory.date#</td>
            <td>#errorHistory.action#</td>
            <td>#errorHistory.comment#</td>
            <td>#errorHistory.name# #errorHistory.surname#</td>
          </tr>
        </cfoutput>
      </tbody>
    </table>
  </main>
</body>
</html>