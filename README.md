## Module Modération

Module qui permet de modérer automatiquement les attributs d'un modèle Ruby on Rails.

La modération consiste à rejeter les contenus haineux ou contraires à la loi grâce à une API de modération.

Le module, nommé Moderable, prend la forme d'un "concern" Rails qui peut être inclus dans d'autres classes.

```ruby
# Le concern de modération
module Moderable
  extend ActiveSupport::Concern
 
  # code
end

# Une classe qui souhaite faire appel à la modération de ses attributs
class ModeratedModel < ApplicationRecord
  include Moderable
 
  # code
end
```
Le concern prend en argument la ou les colonnes qui seront modérées.

Le concern appel l'API de modération pour voir si le contenu des colonnes est rejeté ou accepté, et stocker le résultat sous forme de booléen dans la classe modérée dans une colonne appelée "is_accepted".

Les classes qui incluent le concern Moderable doivent avoir une colonne "is_accepted".

URL de l'API de modération : https://moderation.logora.fr  (utiliser la route /predict)
Documentation : https://moderation.logora.fr/docs/ 
