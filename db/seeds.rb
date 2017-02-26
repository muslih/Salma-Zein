# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Station
st1 = Station.create(name: 'Station Palangkaraya')

# Department
dp1 = Department.create(station_id: 1, name: 'Department 1', manager: 'manager 1')
dp2 = Department.create(station_id: 1, name: 'Department 2', manager: 'manager 2')
dp3 = Department.create(station_id: 1, name: 'Department 3', manager: 'manager 3')

# Position
pn1 = Position.create(name: 'Administrator', department_id: 1)
pn2 = Position.create(name: 'Kitchen', department_id: 1)
pn3 = Position.create(name: 'Quality Control', department_id: 1)
pn4 = Position.create(name: 'Logistik', department_id: 1)
pn5 = Position.create(name: 'Administrasi', department_id: 1)
pn6 = Position.create(name: 'Operational', department_id: 1)

# user
us1 = User.create(username: 'administrator', password: 'administrator', password_confirmation: 'administrator', email: 'administrator@gmail.com')
us2 = User.create(username: 'kitchen', password: 'kitchen', password_confirmation: 'kitchen', email: 'kitchen@gmail.com')
us3 = User.create(username: 'qualitycontrol', password: 'qualitycontrol', password_confirmation: 'qualitycontrol', email: 'qualitycontrol@gmail.com')
us4 = User.create(username: 'logistik', password: 'logistik', password_confirmation: 'logistik', email: 'logistik@gmail.com')
us5 = User.create(username: 'administrasi', password: 'administrasi', password_confirmation: 'administrasi', email: 'administrasi@gmail.com')
us6 = User.create(username: 'operational', password: 'operational', password_confirmation: 'operational', email: 'operational@gmail.com')


# Religion
rg1 = Religion.create(name: 'Islam')
rg2 = Religion.create(name: 'Kristen Katolik')
rg3 = Religion.create(name: 'Kristen Protestan')
rg4 = Religion.create(name: 'Hindu')
rg5 = Religion.create(name: 'Budha')
rg6 = Religion.create(name: 'Konghucu')

# Education
ed1 = Education.create(name: 'SD')
ed2 = Education.create(name: 'SMP')
ed3 = Education.create(name: 'SMA / SMK / MA sederajat')
ed4 = Education.create(name: 'Diploma')
ed5 = Education.create(name: 'Sarjana')
ed6 = Education.create(name: 'Magister')
ed7 = Education.create(name: 'Profesor')
 
# Gender
gd1 = Gender.create(name: 'Laki-Laki')
gd2 = Gender.create(name: 'Perempuan')

# Employee
pg1 = Employee.create(name: 'Pegawai administrator', role: 'administrator', age: 18, birth_place: 'Palangkaraya', birth_date: '1998-07-09', gender_id: 1, religion_id: 1, position_id: 1 ,education_id: 3, experience: '', skill: '', user_id: 1)
pg2 = Employee.create(name: 'Pegawai kitchen', role: 'kitchen', age: 19, birth_place: 'Palangkaraya', birth_date: '1998-07-20', gender_id: 2, religion_id: 1, position_id: 2, education_id: 3, experience: '', skill: '', user_id: 2)
pg3 = Employee.create(name: 'Pegawai qualitycontrol', role: 'qualitycontrol', age: 20, birth_place: 'Palangkaraya', birth_date: '1998-07-21', gender_id: 1, religion_id: 1, position_id: 3, education_id: 3, experience: '', skill: '', user_id: 3)
pg3 = Employee.create(name: 'Pegawai logistik', role: 'logistik', age: 21, birth_place: 'Palangkaraya', birth_date: '1998-07-22', gender_id: 1, religion_id: 1, position_id: 3, education_id: 3, experience: '', skill: '', user_id: 4)
pg3 = Employee.create(name: 'Pegawai administrasi', role: 'administrasi', age: 22, birth_place: 'Palangkaraya', birth_date: '1998-07-23', gender_id: 1, religion_id: 1, position_id: 4, education_id: 3, experience: '', skill: '', user_id: 5)
pg3 = Employee.create(name: 'Pegawai operational', role: 'operational', age: 23, birth_place: 'Palangkaraya', birth_date: '1998-07-24', gender_id: 1, religion_id: 1, position_id: 5, education_id: 3, experience: '', skill: '', user_id: 6)
# Supplier
supp1 = Supplier.create(name: 'Supplier 1', address: 'jl.supp 1', contact_person: 'manager sup 1', phone: '08123123123', business_field: 'food', management_system: 'ms')
supp2 = Supplier.create(name: 'Supplier 2', address: 'jl.supp 2', contact_person: 'manager sup 2', phone: '08321321321', business_field: 'material', management_system: 'sm')

# Kategori
kt1 = ItemCategory.create(name: 'Buah')
kt2 = ItemCategory.create(name: 'Sayur')
kt3 = ItemCategory.create(name: 'Material')

# Satuan
un1 = ItemUnit.create(name: 'Gram')
un2 = ItemUnit.create(name: 'Kilogram')
un3 = ItemUnit.create(name: 'Ton')

# Item
itm1 = Item.create(supplier_id: 1, item_category_id: 1, item_unit_id: 2, code: 'B001', name: 'Buah Apel', spec: 'merah', price: '100000', desc: 'apel madu', halal_certificate: 'certifikat1jpg', warranty: true)

itm2 = Item.create(supplier_id: 2, item_category_id: 2, item_unit_id: 2, code: 'B002', name: 'Aqua Botol Medium', spec: 'ukuran sedang', price: '8000', desc: '100ml', halal_certificate: 'certifikat1jpg', warranty: true)