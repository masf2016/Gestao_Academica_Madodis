<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Madodis - Cadastrar/Alterar Turmas</title>
<link rel="favicon" href="/madodis/resources/images/favicon.png">
<link rel="stylesheet" media="screen"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="/madodis/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="/madodis/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/madodis/resources/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="/madodis/resources/css/style.css">
<link rel='stylesheet' id='camera-css'
	href='/madodis/resources/css/camera.css' type='text/css' media='all'>
	<link rel='stylesheet' href="/madodis/resources/css/jAlert.css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="/madodis/resources/js/html5shiv.js"></script>
	<script src="/madodis/resources/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<jsp:include page="../menu.jsp">
		<jsp:param value="${user}" name="user" />
	</jsp:include>
		<div class="container">
			<h3>
				<c:choose>
					<c:when test="${turma.id < 1}">
						<legend>Cadastrar Turma</legend>
					</c:when>
					<c:otherwise>
						<legend>Atualizar Turma</legend>
					</c:otherwise>
				</c:choose>
			</h3>
		</div>
		<div class="container">
			<div class="col-mod-4"></div>
			<div class="col-mod-4">
			
				<c:choose>
					<c:when test="${turma.id < 1}">
						<c:set var="my_action" value="/madodis/adicionarTurma"/>
						<c:set var="my_method" value="post"/>
					</c:when>
					<c:otherwise>
						<c:set var="my_action" value="/madodis/atualizarTurma"/>
						<c:set var="my_method" value="put"/>
					</c:otherwise>
				</c:choose>
			
				<form:form method="${my_method}" action="${my_action}"
					commandName="turma">
					<form:hidden path="id"/>
					<div class="form-group">
						<div class="col-sm-6">
							<label>Nome:</label>
							<form:input path="nome" cssClass="form-control"></form:input>
							<form:errors path="nome" cssClass="error"></form:errors>
						</div>
						<div class="col-sm-6">
							<label>Letra:</label>
							<form:select cssClass="form-control" path="turmaLetra">
								<form:options items="${letras}"/>
							</form:select>
						</div>
						<div class="col-sm-6">
							<label>Turno:</label>
							<form:input path="turno" cssClass="form-control"></form:input>
							<form:errors path="turno" cssClass="error"></form:errors>
						</div>
						<div class="col-sm-6">
							<label>Disciplina:</label>
							<form:select cssClass="form-control" path="disciplina">
								<form:options items="${disciplinas}" itemLabel="nome" itemValue="id"/>
							</form:select>
						</div>
						<div class="col-sm-6">
							<label>Quantidade Minima de Discentes:</label>
							<form:input path="quantidadeMinimaAluno" cssClass="form-control"></form:input>
							<form:errors path="quantidadeMinimaAluno" cssClass="error"></form:errors>
						</div>
						<div class="col-sm-6">
							<label>Quantidade Maxima de Discentes:</label>
							<form:input path="quantidadeMaximaAluno" cssClass="form-control"></form:input>
							<form:errors path="quantidadeMaximaAluno" cssClass="error"></form:errors>
						</div>
					</div>
						<div class="form-group">
	    					<div class="col-sm-10">
	    					<br/>
	    					<br/>
					<input type="submit" value="Salvar" class="btn btn-success" />
							</div>
						</div>
					<br />
					<br />
				</form:form>
			</div>
			<div class="col-mod-4"></div>
		</div>
		
		<jsp:include page="../rodape.jsp" />
	</body>
</html>