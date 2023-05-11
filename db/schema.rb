# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_10_204301) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schedules", force: :cascade do |t|
    t.time "lunes_inicio"
    t.time "lunes_fin"
    t.time "martes_inicio"
    t.time "martes_fin"
    t.time "miercoles_inicio"
    t.time "miercoles_fin"
    t.time "jueves_inicio"
    t.time "jueves_fin"
    t.time "viernes_inicio"
    t.time "viernes_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.time "sabado_inicio"
    t.time "sabado_fin"
    t.time "domingo_inicio"
    t.time "domingo_fin"
    t.index ["name"], name: "index_schedules_on_name", unique: true
  end

  create_table "sucursals", force: :cascade do |t|
    t.string "nombre"
    t.string "dirección"
    t.string "telefono"
    t.bigint "schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nombre"], name: "index_sucursals_on_nombre", unique: true
    t.index ["schedule_id"], name: "index_sucursals_on_schedule_id"
  end

  create_table "turns", force: :cascade do |t|
    t.bigint "sucursal_id", null: false
    t.date "fecha"
    t.string "reason"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "hora"
    t.bigint "creador_id"
    t.bigint "empleados_id"
    t.string "comentario"
    t.index ["creador_id"], name: "index_turns_on_creador_id"
    t.index ["empleados_id"], name: "index_turns_on_empleados_id"
    t.index ["sucursal_id"], name: "index_turns_on_sucursal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rol"
    t.bigint "sucursal_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sucursal_id"], name: "index_users_on_sucursal_id"
  end

  add_foreign_key "sucursals", "schedules"
  add_foreign_key "turns", "sucursals"
  add_foreign_key "turns", "users", column: "creador_id"
  add_foreign_key "turns", "users", column: "empleados_id"
  add_foreign_key "users", "sucursals"
end