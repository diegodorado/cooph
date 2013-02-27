---
title: Extender sfDoctrineGuardPlugin con un Perfil de Usuario
tags: wiki
---

       * « symfony and doctrine: default table collation, a better solution
       * symfony plugin: install and uninstall manually »

symfony: sfDoctrineGuardPlugin and customizing user profile

by prettyscripts on 2010-03-03 11:43:54

symfony

sfDoctrineGuardPlugin provides basic authentication. sf\_guard\_user
table only contains minimal fields to make this feature work. all other
user relevant information such as name, birthday, contact numbers etc
require a new table sf\_guard\_user\_profile that works with this.

however at the moment user profile setup is poorly documented from the
official plugin page.

further information can be found here on how to customize the user
profile for frontend and backend. note that this was written for symfony
V1.2, some commands maybe be obsoleted and needed to be replaced with
newer commands.

here are some main points from the document.

user profile schema

add in config/doctrine/schema.yml to create a 1-1 relation between
sfGuardUser and sfGuardUserProfile:

Code: sfGuardUserProfile: tableName: sf\_guard\_user\_profile actAs: {
Timestampable: \~, Signable: \~ } options: { collate: utf8\_unicode\_ci,
charset: utf8 } columns: id: { type: integer(4), primary: true,
autoincrement: true } user\_id: { type: integer(4), notnull: true }
fullname: { type: string(80) } email: { type: string(100) } relations:
User: class: sfGuardUser foreign: id local: user\_id type: one onDelete:
cascade foreignType: one foreignAlias: Profile

sample data for data/fixture:

Code: sfGuardUser: sgu\_admin: username: admin password: admin
is\_super\_admin: true Profile: fullname: Administrator email:
admin@some.email.address sgu\_user: username: user password: user
is\_super\_admin: false Profile: fullname: User email:
user@some.email.address embed profile in user form

step 1:

cp
plugins/sfDoctrineGuardPlugin/lib/form/doctrine/sfGuardUserAdminForm.class.php
lib/form/doctrine/

step 2: edit the form

PHP: public function configure() { parent::configure();

$profileForm = new ProfileForm($this-\>object-\>Profile);
unset($profileForm['id'], $profileForm['sf\_guard\_user\_id']);
$this-\>embedForm('Profile', $profileForm); }

step 3: manually create module for sfGuardUser and edit generator.yml:

Code: generator: class: sfDoctrineGenerator param: config: form: class:
sfGuardUserAdminForm display: "NONE": [username, password,
password\_again, Profile] "Permissions and groups": [is\_active,
is\_super\_admin, groups\_list, permissions\_list]

© prettyscripts. like this article? please rate and subscribe!

Tags: doctrine, profile, symfony, user 1 comment Comment by Ryan @
2010-10-08 01:32:23

-   -   -   -   -

Thank you for the instructions. As you know, documentation on
sfDoctrineGuardPlugin is lacking.

Unfortunately, I encounter two errors. The first is minor in that
Signable does not appear to be supported anymore. The second one causes
more trouble. The User Profile schema and fixtures examples given above
throw errors for me in symfony 1.4 with mysql 5: SQLSTATE[23000]:
Integrity constraint violation: 1062 Duplicate entry *for key 2*

I fixed this by eliminating the user\_id column from sfGuardUserProfile
and changing the relationship to use id for the local key and the
foreign key. This makes more logical sense as well, and was something
that I was planning to try anyway after getting everything working.
Preliminary tests suggests that this fixes the problem.

Crossing my fingers that it won't cause problems down the road.

\
 Ref:
[http://www.prettyscripts.com/framework/symfony/symfony-sfdoctrineguardplugin-and-customizing-user-profile](http://www.prettyscripts.com/framework/symfony/symfony-sfdoctrineguardplugin-and-customizing-user-profile)
