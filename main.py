from pymongo import MongoClient
from datetime import datetime

if __name__ == '__main__':
    client = MongoClient('localhost:27017')
    TPdb = client['TPdb']

    Produit = TPdb['Produit']

    Produit1 = {
        "ID": '001',
        "Quantité": 200,
        "Description": "Produit 1",
        "date": '1'
    }

    Produit2 = {
        "ID": '002',
        "Quantité": 200,
        "Description": "Produit 2",
        "date": datetime.utcnow()
    }

    Produit3 = {
        "ID": '003',
        "Quantité": 200,
        "Description": "Produit 3",
        "date": datetime.utcnow()
    }

    Commande = TPdb['Commande']

    Commande1 = {
        "Nom": 'DeClerck',
        "Prenom": 'Thierry',
        "ID": 1,
        "Description": "Commande 1",
        "date": datetime.utcnow()
    }

    Commande2 = {
        "Nom": 'Lasne',
        "Prenom": 'Mathilde',
        "ID": 2,
        "Description": "Commande 2",
        "date": datetime.utcnow()
    }

    Commande3 = {
        "Nom": 'Bergon',
        "Prenom": 'Felix',
        "ID": 3,
        "Description": "Commande 3",
        "date": datetime.utcnow()
    }

    InventaireProduits = TPdb['InventaireProduits']

    InventaireProduits1 = {
        "ID": 1,
        "Description": "Inventaire du produit 1",
        "Quantité": 200
    }

    InventaireProduits2 = {
        "ID": 2,
        "Description": "Inventaire du produit 2",
        "Quantité": 200
    }

    InventaireProduits3 = {
        "ID": 3,
        "Description": "Inventaire du produit 3",
        "Quantité": 200
    }

    Caisse = TPdb['Caisse']

    Caisse1 = {
        "ID": 1,
        "Description": " Caisse numéro 1",
        "Quantité vendu du produit 1":50,
        "Quantité vendu du produit 2": 50,
        "Quantité vendu du produit 3": 50,
    }

    Caisse2 = {
        "ID": 2,
        "Description": " Caisse numéro 2",
        "Quantité vendu du produit 1": 50,
        "Quantité vendu du produit 2": 50,
        "Quantité vendu du produit 3": 50,
    }

    Caisse3 = {
        "ID": 3,
        "Description": " Caisse numéro 3",
        "Quantité vendu du produit 1": 50,
        "Quantité vendu du produit 2": 50,
        "Quantité vendu du produit 3": 50,
    }

# Question 1

nombre_de_produits_vendus = Caisse.aggregate(
    [
        {
            "$addFields":
                {
                "id": 1,
                "totalProduitvendus": {"$sum": "$produit1" and "$produit2"}
                }
        }
    ]
)
for agg in nombre_de_produits_vendus:
    print(agg)
print(Caisse.find_one())