We all know of the method of setting up a new Proc in your environment.rb file to customize how error fields are displayed. We also all know how much of a pain in the butt that is, and how it makes your pretty Rails app look clustered if you want to set a different Proc for every model. Enter custom_field_error.

custom_field_error "<span id='error'>?</span>"

Which would produce the following on a field named 'name' under the object 'user':

<span id='error'><input id="user_name" name="username?" size="30" type="text" value="" /></span>

Bam. You're done. Just set that anywhere in your model itself (as in, not within a subfunction) and you're good to go. Very simple, and very useful.