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
            <div class="field-value handwrite">{{character.class_}} {{character.level}}</div>
            <div class="field-label">Clase y nivel</div>
          </div>
          <div class="info-field col pl-1 pr-1">
            <div class="field-value handwrite">{{character.background}}</div>
            <div class="field-label">Trasfondo</div>
          </div>
          <div class="info-field col pl-1 pr-1">
            <div class="field-value handwrite">{{player.name}}</div>
            <div class="field-label">Jugador</div>
          </div>
        </div>
        <div class="row p-2">
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">{{character.race}}</div>
            <div class="field-label">Raza</div>
          </div>
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">{{character.alignment}}</div>
            <div class="field-label">Alineamiento</div>
          </div>
          <div class="info-field col pl-1 pr-2">
            <div class="field-value handwrite">{{character.experience}}</div>
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
                  <span class="small">{{character.abilities.strength.value}}</span>
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
                  <span class="small">{{character.abilities.dexterity.value}}</span>
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
                  <span class="small">{{character.abilities.constitution.value}}</span>
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
                  <span class="small">{{character.abilities.intelligence.value}}</span>
                </div>
              </div>
              <div class="value-large text-center mt-1 mb-2">
                <div class="bordered rounded p-1 pb-3 bg-white">
                  <div class="title">Sabiduría</div>
                  <div class="value pt-2 pb-3 handwrite">{{character.abilities.wisdom.modifier}}</div>
                </div>
                <div style="margin-top: -24px; width: 40px; height: 40px;"
                  class="bordered rounded handwrite bg-white ml-auto mr-auto pt-1">
                  <span class="small">{{character.abilities.wisdom.value}}</span>
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
                  <span class="small">{{character.abilities.charisma.value}}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8 pl-2">
            <div class="bordered rounded p-2">
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Fuerza</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.strength}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Destreza</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.dexterity}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Constitución</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.constitution}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Inteligencia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.intelligence}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  <i class="fa fa-circle-o"></i>
                  <span class="handwrite proficiency-cross">x</span>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Sabiduría</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.wisdom}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0">
                  <i class="fa fa-circle-o"></i>
                  <span class="handwrite proficiency-cross">x</span>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Carisma</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.saving_throws.charisma}}</div>
                </div>
              </div>
              <div class="text-center title bottom">Tiradas de salvación</div>
            </div>
            <div class="mt-2 bordered rounded p-2">
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Acrobacias</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.acrobatics}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                  <span class="handwrite proficiency-cross">x</span>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Arcanos</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.arcana}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                  <span class="handwrite proficiency-cross">x</span>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Atletismo</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.athletics}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                  <span class="handwrite proficiency-cross">x</span>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Engañar</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.deception}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Historia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.history}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Interpretación</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.performance}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Intimidar</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.intimidation}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Investigación</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.investigation}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Juego de Manos</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.sleight_of_hand}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Medicina</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.medicine}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Naturaleza</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.nature}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                  <span class="handwrite proficiency-cross">x</span>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Percepción</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.perception}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Perspicacia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.insight}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Persuasión</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.persuasion}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Religión</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.religion}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Sigilo</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.stealth}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Supervivencia</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.survival}}</div>
                </div>
              </div>
              <div class="row m-0 mb-1">
                <div class="col-1 p-0 text-center">
                  <i class="fa fa-circle-o"></i>
                </div>
                <div class="col-9 pl-1 pr-1">
                  <div class="text-transform-none small">Trato con Animales</div>
                </div>
                <div class="col-2 pl-0 pr-2 text-center">
                  <div class="handwrite small">{{character.skills.animal_handling}}</div>
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
            <div class="value p-1 handwrite x-small" style="height: 438px">
              <div class="mt-2">
                <div class="underline">Competencias:</div>
                <div>{{character.proficiencies}}</div>
              </div>
              <div class="mt-2">
                <div class="underline mt-2">Idiomas:</div>
                <div>{{character.languages}}</div>
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
                    {{character.personality_traits}}</div>
                  <div class="title bottom text-center">Rasgos de personalidad</div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col mt-1">
              <div class="value-large">
                <div class="bordered p-1 bg-white">
                  <div class="value p-1 handwrite xx-small" style="height: 85px">{{character.ideals}}
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
                  <div class="value p-1 handwrite xx-small" style="height: 85px">{{character.bonds}}
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
                  <div class="value p-1 handwrite xx-small" style="height: 85px">{{character.flaws}}
                  </div>
                  <div class="title bottom text-center">Defectos</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-2 bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite x-small" style="height: 740px">
            {% for trait in character.traits %}
            <div class="underline">{{trait.name}}:</div>
            <div>{{trait.description}}</div>
            {% endfor %}
          </div>
          <div class="title bottom text-center">Rasgos y atributos</div>
        </div>
      </div>
    </div>
    <!-- Footer 0 -->

    <!-- Página 2 -->
    <div style="page-break-after: always"></div>
    <div class="row">
      <div class="col-3 p-0">
        <div class="info-field p-2">
          <div class="field-value handwrite" style="margin-top: 22px">{{character.name}}</div>
          <div class="field-label">Nombre del personaje</div>
        </div>
      </div>
      <div class="col-9 bordered rounded">
        <div class="row align-items-center m-0 small" style="min-height: 60px; border-bottom: 1px black solid;">
          <div class="col value p-1 handwrite small" style="max-height: 100%">{{character.appearance}}</div>
        </div>
        <div class="field-label small">Apariencia</div>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-4 p-0">
        <div class="bordered rounded p-1 bg-white">
          <div class="row align-items-center" style="height: 420px">

            <div class="col text-center pb-1">
              <img src={{character.image}} style="max-width: 100%; max-height: 100%">
            </div>

          </div>
          <div class="title bottom text-center">Apariencia</div>
        </div>
        <div class="mt-3 bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite xx-small" style="height: 850px">{{character.notes}}</div>
          <div class="title bottom text-center">Notas adicionales</div>
        </div>
      </div>
      <div class="col-8 pr-0">
        <div class="bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite xx-small" style="height: 140px">{{ character.history }}</div>
          <div class="title bottom text-center">Historia del personaje</div>
        </div>
        <div class="mt-3 bordered rounded p-1 bg-white">
          <div class="value p-1 handwrite xx-small" style="height: 1130px">
            {% for trait in character.traits %}
            <div class="pt-1 pb-1">
              <div>
                <i class="fa fa-caret-right" aria-hidden="true"></i>
                <span class="underline">{{ trait.name }}:</span>
                {{ trait.description }}
              </div>
            </div>
            {% else %}
            <div class="pt-1 pb-1">
              <div>
                <em>No hay rasgos definidos.</em>
              </div>
            </div>
            {% endfor %}
          </div>
          <div class="title bottom text-center">Rasgos</div>
        </div>
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
                    <div class="field-value handwrite">{{character.class_}}</div>
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
        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel 1</div>
              <div class="align-items-center" style="height: 48px">
                <div class="value handwrite p-0">{{character.spells.level_1.list | length}}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells.level_1.slots | int) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {%endfor%}
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel 2</div>
              <div class="align-items-center" style="height: 48px">
                <div class="value handwrite p-0">{{character.spells.level_2.list | length}}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells.level_2.slots | int) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {%endfor%}
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel 3</div>
              <div class="align-items-center" style="height: 48px">
                <div class="value handwrite p-0">{{character.spells.level_3.list | length}}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells.level_3.slots | int) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {%endfor%}
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel 4</div>
              <div class="align-items-center" style="height: 48px">
                <div class="value handwrite p-0">{{character.spells.level_4.list | length}}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells.level_4.slots | int) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {%endfor%}
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel 5</div>
              <div class="align-items-center" style="height: 48px">
                <div class="value handwrite p-0">{{character.spells.level_5.list | length}}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells.level_5.slots | int) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {%endfor%}
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col pl-0 pr-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Nivel 6</div>
              <div class="align-items-center" style="height: 48px">
                <div class="value handwrite p-0">{{character.spells.level_6.list | length}}</div>
                <div class="text-center p-0" style="font-size: 16px; line-height: 16px;">
                  {% for i in range(character.spells.level_6.slots | int) %}
                  <i class="fa fa-circle-o" style="margin-left: 1px; margin-right: 1px;"></i>
                  {%endfor%}
                </div>
              </div>
            </div>
          </div>
        </div>



        <div class="col pr-0 pl-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Conjuros</div>
              <div class="value handwrite p-0">{{character.spells.total}}</div>
              <div class="title bottom small">conocidos</div>
            </div>
          </div>
        </div>


        <div class="col pr-0 pl-1">
          <div class="value-large text-center">
            <div class="bordered rounded p-1 bg-white">
              <div class="title">Trucos</div>
              <div class="value handwrite p-0">{{character.cantrips.total}}</div>
              <div class="title bottom small">conocidos</div>
            </div>
          </div>
        </div>

      </div>
    </div>
    <div class="row mt-3">
      <div class="bordered rounded col-12 pl-0 pr-0 pt-1 overflow-hidden" style="height: 1210px">
        <div class="row m-0 x-small pt-1 pb-1">
          <div class="col-1 text-center pl-0 pr-0">Prep Nivel</div>
          <div class="col-2 pl-0">Nombre</div>
          <div class="col-2">Escuela</div>
          <div class="col-2">Tiempo lanzamiento</div>
          <div class="col-3">Duración</div>
          <div class="col-1">Alcance</div>
          <div class="col-1 text-center pl-0 pr-0">Comps</div>
        </div>

        {% for spell in character.spells.level_1.list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0">
            <div class="col-1 text-center pl-0 pr-0">
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-1">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
        {% for spell in character.spells.level_2.list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0">
            <div class="col-1 text-center pl-0 pr-0">
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-1">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
        {% for spell in character.spells.level_3.list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0">
            <div class="col-1 text-center pl-0 pr-0">
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-1">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
        {% for spell in character.spells.level_4.list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0">
            <div class="col-1 text-center pl-0 pr-0">
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-1">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
        {% for spell in character.spells.level_5.list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0">
            <div class="col-1 text-center pl-0 pr-0">
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-1">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
        {% for spell in character.spells.level_6.list %}
        <div class="spell-row handwrite xx-small pt-1 pb-1">
          <div class="row m-0">
            <div class="col-1 text-center pl-0 pr-0">
              {{ spell.level }}
            </div>
            <div class="col-2 underline pl-0">{{ spell.name }}</div>
            <div class="col-2">{{ spell.school }}</div>
            <div class="col-2">{{ spell.casting_time }}</div>
            <div class="col-3">{{ spell.duration }}</div>
            <div class="col-1">{{ spell.range }}</div>
            <div class="col-1 text-center pl-0 pr-0">{{ spell.components }}</div>
          </div>
          <div class="row ml-0 mr-0 mt-1">
            <div class="col-12">
              {{ spell.description }}
            </div>
          </div>
        </div>
        {% endfor %}
      </div>
    </div>
  </div>
</body>

</html>