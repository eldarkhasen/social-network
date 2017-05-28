<form class="form-horizontal" action='?act=singup' method="POST">
  <fieldset>
    <div id="legend">
      <legend class="">Register</legend>
    </div>
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Username</label>
      <div class="controls">
        <input type="text" id="username" name="login" placeholder="" class="input-xlarge">
        <p class="help-block">Username can contain any letters or numbers, without spaces</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
        <p class="help-block">Please provide your E-mail</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
        <p class="help-block">Password should be at least 4 characters</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Password -->
      <label class="control-label"  for="password_confirm">Password (Confirm)</label>
      <div class="controls">
        <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="input-xlarge">
        <p class="help-block">Please confirm password</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Name -->
      <label class="control-label"  for="name">Name</label>
      <div class="controls">
        <input type="text" id="username" name="name" placeholder="" class="input-xlarge">
        <p class="help-block">Name can contain any letters or numbers, without spaces</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="surname">Surname</label>
      <div class="controls">
        <input type="text" id="username" name="surname" placeholder="" class="input-xlarge">
        <p class="help-block">Surname can contain any letters or numbers, without spaces</p>
      </div>
    </div>
 
 
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">AGE</label>
      <div class="controls">
        
        <select name ="age" class="input-xlarge" >
          <?php
              for($i=5;$i<90;$i++){
                echo "<option value = ". $i."> ".$i ." </option>" ;

              }
          ?>
        </select>
        <p class="help-block">Please select your age</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button class="btn btn-success">Register</button>
      </div>
    </div>
  </fieldset>
</form>