resources = [
  { name: "Lua",
    role_id: 2,
    resource_type_id: 1 },
  { name: "Mafra",
    role_id: 2,
    resource_type_id: 1 },
  { name: "Diogo",
    role_id: 2,
    resource_type_id: 1 },
  { name: "Ben Polge",
    role_id: 2,
    resource_type_id: 1 },
  { name: "Alex Mitelli",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Anthony",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Remy",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Alessandro Alves",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Mike",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Ian",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Spencer",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Augustin",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Pablo",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Francisco",
    role_id: 1,
    resource_type_id: 1 },
  { name: "Alejandro",
    role_id: 1,
    resource_type_id: 2 },
  { name: "David",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Emiliano",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Enrique",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Fernando",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Gabriel",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Javier",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Leonardo",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Emmanuel",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Roberto",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Diego Toranzo",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Pablo Liaudat",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Mauro",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Mariano",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Alan",
    role_id: 1,
    resource_type_id: 2 },
  { name: "Alex",
    role_id: 1,
    resource_type_id: 2 }
]

resources.each { |resources_attrs| Resource.find_or_create_by(resources_attrs) }