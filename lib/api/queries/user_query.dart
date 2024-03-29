class UserQuery {
  // Get all titles.
  String getTitles() {
    return """
      query {
        titles {
          id
          name  
        }
      }""";
  }

  // Get all locations.
  String getLocations() {
    return """
      query {
        sites {
          id
          name  
        }
      }""";
  }

  // Get all professions.
  String getProfessions() {
    return """
      query {
        professions {
          id
          title
        }
      }""";
  }

  String getNationalities() {
    return """ query {
            nationalities {
              id
              name
            }
        }""";
  }

  // Get all users
  String getUsers() {
    return """
      query {
        users {
          name  
        }
      }""";
  }

  // Get a single user from ID.
  String getUser() {
    return """
      query user (\$id: ID!){
        user (id: \$id) {
          id
          name
          email
          avatar
          messages {
            id 
            title 
            body
            read 
            created_at
          }
          vouchers {
            id
            name
            sub_title
            code
          }
          orders {
            id
          }
          profile {
            firstname
            lastname
            mobile_number
            points
            food_stamp
            drink_stamp
            profession {
              id
              title
            }
            nationality {
              id
              name
            }
            site {
              id
              name
            }
            alerts {
               email
               notification
               text
            }
          }
        }
      }""";
  }
}
