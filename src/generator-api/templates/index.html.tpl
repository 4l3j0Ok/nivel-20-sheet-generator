<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="./templates/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap v4 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <!-- Icons -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>

<body>

  <div class="container pb-0">
    <div class="row">
      <div class="col-3 p-0">
        <div class="logo-wrapper text-center">
          <img class="logo-img" src="https://nivel20.com/img/dnd-logo-black.png" />
        </div>
        <div class="info-field p-2 mt-1">
          <div class="field-value handwrite">{{character.name}}</div>
          <div class="field-label">Nombre del personaje</div>
        </div>
      </div>
      <div class="col-9 bordered rounded">
        <div class="row p-2">
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">
              {% for class in character.classes %}
              {{class.name}} {{character.level}}
              {% endfor %}
            </div>
            <div class="field-label">Clase y nivel</div>
          </div>
          <div class="info-field col pl-1 pr-1">
            <div class="field-value handwrite">{{character.background.name}}</div>
            <div class="field-label">Trasfondo</div>
          </div>
          <div class="info-field col pl-1 pr-1">
            <div class="field-value handwrite">{{character.player_name}}</div>
            <div class="field-label">Jugador</div>
          </div>
        </div>
        <div class="row p-2">
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">{{character.race}}</div>
            <div class="field-label">Raza</div>
          </div>
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">{{character.fields.alignment}}</div>
            <div class="field-label">Alineamiento</div>
          </div>
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">
              {% if character.fields.experience_points %}
              {{character.fields.experience_points}}
              {% endif %}
            </div>
            <div class="field-label">Puntos de experiencia</div>
          </div>
        </div>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-4 pr-0">
        <div class="row">
          <div class="col-4 p-0">
            <div class="bg-light-grey rounded p-2 pt-3">
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Fuerza</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.strength.modifier}}
                  </div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.strength.total}}</span>
                </div>
              </div>
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Destreza</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.dexterity.modifier}}
                  </div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.dexterity.total}}</span>
                </div>
              </div>
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Constitución</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.constitution.modifier}}
                  </div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.constitution.total}}</span>
                </div>
              </div>
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Inteligencia</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.intelligence.modifier}}
                  </div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.intelligence.total}}</span>
                </div>
              </div>
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Sabiduría</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.wisdom.modifier}}</div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.wisdom.total}}</span>
                </div>
              </div>
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Carisma</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.charisma.modifier}}
                  </div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.charisma.total}}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8 pl-2">
            <div class="bordered rounded p-2">
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  {% if character.saving_throws.strength.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Fuerza</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.strength.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  {% if character.saving_throws.dexterity.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Destreza</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.dexterity.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  {% if character.saving_throws.constitution.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Constitución</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.constitution.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  {% if character.saving_throws.intelligence.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Inteligencia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.intelligence.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  {% if character.saving_throws.wisdom.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Sabiduría</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.wisdom.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  {% if character.saving_throws.charisma.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Carisma</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.charisma.value}}</div>
                </div>
              </div>
              <div class="text-center title bottom">Tiradas de salvación</div>
            </div>
            <div class="mt-2 bordered rounded p-2">
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.acrobatics.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Acrobacias</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.acrobatics.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.arcana.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Arcanos</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.arcana.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.athletics.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Atletismo</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.athletics.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.deception.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Engañar</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.deception.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.history.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Historia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.history.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.performance.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Interpretación</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.performance.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.intimidation.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Intimidar</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.intimidation.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.investigation.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Investigación</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.investigation.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.sleight_of_hand.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Juego de Manos</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.sleight_of_hand.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.medicine.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Medicina</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.medicine.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.nature.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Naturaleza</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.nature.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.perception.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Percepción</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.perception.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.insight.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Perspicacia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.insight.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.persuasion.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Persuasión</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.persuasion.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.religion.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Religión</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.religion.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.stealth.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Sigilo</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.stealth.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.survival.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Supervivencia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.survival.value}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  {% if character.skills.animal_handling.proficiency %}
                  <i class="fa fa-circle"></i>
                  {% else %}
                  <i class="fa fa-circle-o"></i>
                  {% endif %}
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Trato con Animales</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.animal_handling.value}}</div>
                </div>
              </div>
              <div class="text-center title bottom">Habilidades</div>
            </div>
          </div>
        </div>
        <div class="row align-items-center mr-0 mt-3">
          <div class="col-2 bordered text-center p-0">
            <div class="value handwrite" style="line-height: 40px">{{character.passive_wisdom}}</div>
          </div>
          <div class="col-10 bordered rounded-r text-center border-left-0">
            <span class="title">Sabiduría (percepción) pasiva</span>
          </div>
        </div>
        <div class="row mr-0">
          <div class="col mt-3 bordered rounded p-1 bg-white">
            <div class="value p-1 handwrite x-small" style="height: 436px">
              <div class="mt-2">
                <div class="underline">Competencias:</div>
                <div>{{character.proficiencies}}</div>
              </div>
              <div class="mt-2">
                <div class="underline mt-2">Idiomas:</div>
                <div>{{character.fields.languages}}</div>
              </div>
            </div>
            <div class="title bottom text-center">Otras competencias e idiomas</div>
          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="row align-items-center m-0 mb-2">
          <div class="col-2 bordered" style="height: 40px"></div>
          <div class="col-10 bordered rounded-r text-center border-left-0">
            <span class="title">Inspiración</span>
          </div>
        </div>
        <div class="row align-items-center m-0 mb-2">
          <div class="col-2 bordered text-center p-0">
            <div class="value handwrite" style="line-height: 40px">{{character.proficiency_bonus}}</div>
          </div>
          <div class="col-10 bordered rounded-r text-center border-left-0">
            <span class="title">Bonificador de competencia</span>
          </div>
        </div>
        <div class="bg-light-grey rounded p-2">
          <div class="row">
            <div class="col pr-1">
              <div class="value-large text-center">
                <div class="bordered rounded p-1 bg-white">
                  <div class="value pt-3 pb-1 handwrite">{{character.armor_class}}</div>
                  <div class="title bottom">CA</div>
                </div>
              </div>
            </div>
            <div class="col pl-1 pr-1">
              <div class="value-large text-center">
                <div class="bordered rounded p-1 bg-white">
                  <div class="value pt-3 pb-1 handwrite">{{character.initiative}}</div>
                  <div class="title bottom">Iniciativa</div>
                </div>
              </div>
            </div>
            <div class="col pl-1">
              <div class="value-large text-center">
                <div class="bordered rounded p-1 bg-white">
                  <div class="value pt-3 pb-1 handwrite">{{character.speed}}</div>
                  <div class="title bottom">Velocidad</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col mt-2">
            <div class="value-large text-center">
              <div class="bordered rounded-t p-1 bg-white">
                <div class="subvalue">
                  <span class="label">Puntos de Golpe Máximos</span>
                  <span class="handwrite small">{{character.max_hit_points}}</span>
                </div>
                <div class="value pt-3 pb-1 handwrite">&nbsp;</div>
                <div class="title bottom">Puntos de golpe actuales</div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col mt-1">
            <div class="value-large text-center">
              <div class="bordered rounded-b p-1 bg-white">
                <div class="value pt-3 pb-3 handwrite">&nbsp;</div>
                <div class="title bottom">Puntos de golpe temporales</div>
              </div>
            </div>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col pr-1">
            <div class="value-large text-center">
              <div class="bordered rounded p-1 bg-white">
                <div class="subvalue">
                  <span class="label">Total</span>
                  <span class="handwrite small">{{character.hit_dice}}</span>
                </div>
                <div class="value pt-3 pb-1 handwrite">&nbsp;</div>
                <div class="title bottom">Dados de golpe</div>
              </div>
            </div>
          </div>
          <div class="col pl-1">
            <div class="value-large text-center">
              <div class="bordered rounded p-1 bg-white">
                <div class="pt-1 pb-2">
                  <div>
                    <div class="title pt-0 d-inline-block text-muted">Éxitos</div>
                    <div class="d-inline-block"><i class="fa fa-circle-o"
                        style="margin-left: 1px; margin-right: 1px;"></i><i class="fa fa-circle-o"
                        style="margin-left: 1px; margin-right: 1px;"></i><i class="fa fa-circle-o"
                        style="margin-left: 1px; margin-right: 1px;"></i></div>
                  </div>
                  <div>
                    <div class="title pt-0 d-inline-block text-muted">Fallos</div>
                    <div class="d-inline-block"><i class="fa fa-circle-o"
                        style="margin-left: 1px; margin-right: 1px;"></i><i class="fa fa-circle-o"
                        style="margin-left: 1px; margin-right: 1px;"></i><i class="fa fa-circle-o"
                        style="margin-left: 1px; margin-right: 1px;"></i></div>
                  </div>
                </div>
                <div class="title bottom">Salvaciones<br />de muerte</div>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-2 bordered rounded p-1 bg-white">
          <div style="height: 190px">
            <div class="row x-small text-center">
              <div class="col-5">Nombre</div>
              <div class="col-2">Bonif.</div>
              <div class="col-5">Daño/Tipo</div>
            </div>
            {% for attack in character.attacks %}
            <div class="row x-small handwrite m-0">
              <div class="col-5 ellipsize p-0">{{attack.name}}</div>
              <div class="col-2 ellipsize p-0 text-center">{{attack.bonus}}</div>
              <div class="col-5 ellipsize p-0 text-right">{{attack.damage}}</div>
            </div>
            {% endfor %}
          </div>
          <div class="title bottom text-center pb-1">Ataques y lanzamiento de conjuros</div>
        </div>
        <div class="mt-2 bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite x-small" style="height: 510px">
            {% for item in character.equipment %}
            <div>
              - <span>{{item}}</span>
            </div>
            {% endfor %}
          </div>
          <div class="title bottom text-center">Equipo</div>
        </div>
      </div>
      <div class="col-4 p-0">
        <div class="bg-light-grey rounded p-2">
          <div class="row">
            <div class="col mt-1">
              <div class="value-large">
                <div class="bordered rounded-t p-1 bg-white">
                  <div class="value p-1 handwrite xx-small" style="height: 118px">
                    {{character.background.traits}}</div>
                  <div class="title bottom text-center">Rasgos de personalidad</div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col mt-1">
              <div class="value-large">
                <div class="bordered p-1 bg-white">
                  <div class="value p-1 handwrite xx-small" style="height: 85px">{{character.background.ideals}}
                  </div>
                  <div class="title bottom text-center">Ideales</div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col mt-1">
              <div class="value-large">
                <div class="bordered p-1 bg-white">
                  <div class="value p-1 handwrite xx-small" style="height: 85px">{{character.background.bonds}}
                  </div>
                  <div class="title bottom text-center">Vínculos</div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col mt-1">
              <div class="value-large">
                <div class="bordered rounded-b p-1 bg-white">
                  <div class="value p-1 handwrite xx-small" style="height: 85px">{{character.background.flaws}}
                  </div>
                  <div class="title bottom text-center">Defectos</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-2 bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite x-small" style="height: 745px">
            {% for feats in character.feats_and_traits %}
            <div class="underline">{{feats.origin}}</div>
            {% for feat in feats.list %}
            <div>- {{feat.name}}</div>
            {% endfor %}
            {% endfor %}
          </div>
          <div class="title bottom text-center">Rasgos y atributos</div>
        </div>
      </div>
    </div>
    <!-- Footer 0 -->

    <!-- Página 2 -->
    <div style="page-break-after: always"></div>
    <div class="row mt-3">
      <div class="col-3 p-0">
        <div class="info-field p-2">
          <div class="field-value handwrite" style="margin-top: 22px">{{character.name}}</div>
          <div class="field-label">Nombre del personaje</div>
        </div>
      </div>
      <div class="col-9 bordered rounded">
        <div class="row align-items-center m-0 small" style="min-height: 60px; border-bottom: 1px black solid;">
          <div class="col value p-1 handwrite small" style="max-height: 100%">
            {% if character.fields.appearance %}
            {{ character.fields.appearance }}
            {% endif %}
          </div>
        </div>
        <div class="field-label small">Apariencia</div>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-4 p-0">
        <div class="bordered rounded p-1 bg-white" style="height: 420px;">
          <div class="row" style="height: 388px; overflow: hidden">

            <div class="col text-center pb-1">
              <img src="{{character.image}}" class="rounded" style="width: 100%;">
            </div>

          </div>
          <div class="title bottom text-center">Apariencia</div>
        </div>
        <div class="mt-3 bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite xx-small" style="height: 882px">
            {% if character.fields.notes %}
            {{ character.fields.notes }}
            {% endif %}
          </div>
          <div class="title bottom text-center">Notas adicionales</div>
        </div>
      </div>
      <div class="col-8 pr-0">
        <div class="bordered rounded p-1 bg-white" style="height: 100%;">
          <div class="value p-1 handwrite xx-small" style="height: 1318px">
            {% if character.fields.history %}
            {{ character.fields.history }}
            {% endif %}
          </div>
          <div class="title bottom text-center">Historia del personaje</div>
        </div>
      </div>
    </div>
    <div style="page-break-after: always"></div>
    <div class="row">
      <div class="mt-3 bordered rounded p-1 bg-white" style="min-height: 1420px;">
        <div class="value p-1 handwrite xx-small" style="height: calc(100% - 20px)">
          {% for feats in character.feats_and_traits %}
          {% for feat in feats.list %}
          <div>
            <div>
              <p style="margin-bottom: 0.2rem;">
                <i class="fa fa-caret-right" aria-hidden="true"></i>
                <span class="underline">{{ feat.name }}:
                </span>
              </p>
              <span class="handwrite xx-small margin-bottom: 0">{{ feat.description }}</span>
            </div>
          </div>
          {% endfor %}
          {% endfor %}
        </div>
        <div class="title bottom text-center">Rasgos</div>
      </div>
    </div>
    <div style="page-break-after: always"></div>
    <div class="row">
      <div class="col-4 pl-0" style="margin-top: 24px">
        <div class="info-field p-2">
          <div class="field-value handwrite">{{character.name}}</div>
          <div class="field-label">Nombre del personaje</div>
        </div>
      </div>
      <div class="col-8 bg-light-grey rounded">
        <div class="row p-2">
          <div class="col-8 pl-0 pr-2">
            <div class="bordered rounded bg-white pt-3 pb-2">
              <div class="row">
                <div class="col pr-0">
                  <div class="info-field p-2">
                    <div class="field-value handwrite">{{character.classes[-1].name}}</div>
                    <div class="field-label">Clase sortílega</div>
                  </div>
                </div>
                <div class="col pl-0">
                  <div class="info-field p-2">
                    <div class="field-value handwrite">{{character.spellcasting_ability}}</div>
                    <div class="field-label">Característica mágica</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-2 pl-0 pr-1">
            <div class="value-large text-center">
              <div class="bordered rounded pt-1 pb-1 bg-white">
                <div class="value pt-3 pb-1 handwrite">{{character.spell_save_dc}}</div>
                <div class="title bottom">CD Salvación conjuros</div>
              </div>
            </div>
          </div>
          <div class="col-2 pl-1 pr-0">
            <div class="value-large text-center">
              <div class="bordered rounded pt-1 pb-1 bg-white">
                <div class="value pt-3 pb-1 handwrite">{{character.spell_attack_bonus}}</div>
                <div class="title bottom">Bonif. ataque conjuros</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="box-title">Espacios de conjuro</div>
    <div class="row bg-light-grey rounded p-1">
      <div class="col-12 row m-0 p-1">
        {% for level in range(1, 7) %}
        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel {{ level }}</div>
              <div class="align-items-center" style="height: 48px">
                {% if character.spells['level_' ~ level].slots > 0 %}
                <div class="value handwrite p-0">{{ character.spells['level_' ~ level].slots }}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells['level_' ~ level].slots) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {% endfor %}
                </div>
                {% endif %}
              </div>
            </div>
          </div>
        </div>
        {% endfor %}
        <div class="col pr-0 pl-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Conjuros</div>
              <div class="value handwrite p-0">{{character.spells.known_spells}}</div>
              <div class="title bottom small">conocidos</div>
            </div>
          </div>
        </div>


        <div class="col pr-0 pl-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Trucos</div>
              <div class="value handwrite p-0">{{character.spells.known_cantrips}}</div>
              <div class="title bottom small">conocidos</div>
            </div>
          </div>
        </div>

      </div>
    </div>
    <div class="row mt-3">
      <div class="bordered rounded col-12 pl-0 pr-0 pt-1 overflow-hidden" style="min-height: 1210px">
        <div class="row m-0 x-small pt-1 pb-1">
          <div class="col-1 text-center pl-0 pr-0">Prep Nivel</div>
          <div class="col-2 pl-0">Nombre</div>
          <div class="col-2">Escuela</div>
          <div class="col-2">Tiempo lanzamiento</div>
          <div class="col-3">Duración</div>
          <div class="col-1">Alcance</div>
          <div class="col-1 text-center pl-0 pr-0">Comps</div>
        </div>
        {% for index in character.spells %}
        {% for spell in character.spells[index].list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0 mt-1">
            <div class="col-1 text-center pl-0 pr-0">
              {% if level != 'cantrips' %}
              <i class="ml-3 fa fa-square-o"></i>
              {% endif %}
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-3">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
        {% endfor %}
      </div>
    </div>
  </div>
  <style type="text/css">
    body {
      text-transform: uppercase;
      font-family: "Montserrat";
    }

    .ml-row {
      margin-left: -15px;
    }

    .m-row {
      margin-left: -15px;
      margin-right: -15px;
    }

    .info-field {
      width: 100%;
    }

    .info-field .field-value {
      border-bottom: 1px black solid;
      height: 32px;
      line-height: 32px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-size: 1.3em;
    }

    .info-field .field-label {
      font-size: small;
    }

    .x-small {
      font-size: x-small !important;
    }

    .xx-small {
      font-size: xx-small !important;
    }

    .xxx-small {
      font-size: xxx-small !important;
    }

    .handwrite {
      color: #222222;
      text-transform: none;
      font-size: 1.6em;
      line-height: 1em;
    }

    a {
      color: #222222;
      text-decoration: underline;
    }

    .handwrite.small {
      font-size: 1.2em !important;
    }

    .handwrite.x-small {
      font-size: 1em !important;
    }

    .handwrite.xx-small {
      font-size: 0.85em !important;
    }

    .handwrite.xxx-small {
      font-size: 0.7em !important;
    }

    .bold {
      font-weight: bold;
    }

    .underline {
      text-decoration: underline;
    }

    .ellipsize {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .transform-none {
      text-transform: none;
    }

    .bordered {
      border: 3px solid black;
    }

    body .rounded {
      border-radius: 20px !important;
    }

    .rounded-t {
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
    }

    .rounded-b {
      border-bottom-left-radius: 20px;
      border-bottom-right-radius: 20px;
    }

    .rounded-l {
      border-bottom-left-radius: 20px;
      border-top-left-radius: 20px;
    }

    .rounded-r {
      border-top-right-radius: 20px;
      border-bottom-right-radius: 20px;
    }

    .bg-light-grey {
      background-color: #DEDFDF;
    }

    .bg-white {
      background-color: white;
    }

    /* Large value boxes */
    .value-large {}

    .value-large .value {
      font-size: 2em;
    }

    .bordered .title {
      font-size: 10px;
      font-weight: bold;
      padding-top: 3px;
    }

    .bordered .title.small {
      font-size: 8px !important;
    }

    .bordered .handwrite {
      overflow: hidden;
    }

    .overflow-hidden {
      overflow: hidden !important;
    }

    .subvalue .label {
      text-transform: none;
      font-size: small;
      color: grey;
      margin-right: 10px;
      padding-bottom: 3px;
    }

    .subvalue .handwrite {}

    .text-transform-none {
      text-transform: none;
    }

    .proficiency-cross {
      position: absolute;
      left: 0;
      top: -3px;
      font-weight: bold;
    }

    .box-title {
      font-size: 12px;
      font-weight: bold;
    }

    .spell-row {
      border-top: 1px solid darkgray;
    }

    .spell-row:nth-of-type(2n) {
      background-color: #f1f1f1;
    }

    .logo-wrapper {
      height: 75px;
      margin-bottom: -10px !important;
    }

    .logo-img {
      max-width: 95%;
      max-height: 100%;
      display: inline-block;
    }
  </style>
</body>

</html>