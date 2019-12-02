// To parse this JSON data, do
//
//     final listBeerModel = listBeerModelFromJson(jsonString);

import 'dart:convert';

List<ListBeerModel> listBeerModelFromJson(String str) => List<ListBeerModel>.from(json.decode(str).map((x) => ListBeerModel.fromMap(x)));

String listBeerModelToJson(List<ListBeerModel> data) => json.encode(List<String>.from(data.map((x) => x.toMap())));

class ListBeerModel {
    int id;
    String name;
    String tagline;
    String firstBrewed;
    String description;
    String imageUrl;
    double abv;
    double ibu;
    int targetFg;
    double targetOg;
    int ebc;
    double srm;
    double ph;
    double attenuationLevel;
    BoilVolume volume;
    BoilVolume boilVolume;
    Method method;
    Ingredients ingredients;
    List<String> foodPairing;
    String brewersTips;
    ContributedBy contributedBy;

    ListBeerModel({
        this.id,
        this.name,
        this.tagline,
        this.firstBrewed,
        this.description,
        this.imageUrl,
        this.abv,
        this.ibu,
        this.targetFg,
        this.targetOg,
        this.ebc,
        this.srm,
        this.ph,
        this.attenuationLevel,
        this.volume,
        this.boilVolume,
        this.method,
        this.ingredients,
        this.foodPairing,
        this.brewersTips,
        this.contributedBy,
    });

    factory ListBeerModel.fromMap(Map<String, dynamic> json) => ListBeerModel(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        firstBrewed: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        abv: json["abv"].toDouble(),
        ibu: json["ibu"] == null ? null : json["ibu"].toDouble(),
        targetFg: json["target_fg"],
        targetOg: json["target_og"].toDouble(),
        ebc: json["ebc"] == null ? null : json["ebc"],
        srm: json["srm"] == null ? null : json["srm"].toDouble(),
        ph: json["ph"] == null ? null : json["ph"].toDouble(),
        attenuationLevel: json["attenuation_level"].toDouble(),
        volume: BoilVolume.fromMap(json["volume"]),
        boilVolume: BoilVolume.fromMap(json["boil_volume"]),
        method: Method.fromMap(json["method"]),
        ingredients: Ingredients.fromMap(json["ingredients"]),
        foodPairing: List<String>.from(json["food_pairing"].map((x) => x)),
        brewersTips: json["brewers_tips"],
        contributedBy: contributedByValues.map[json["contributed_by"]],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "first_brewed": firstBrewed,
        "description": description,
        "image_url": imageUrl,
        "abv": abv,
        "ibu": ibu == null ? null : ibu,
        "target_fg": targetFg,
        "target_og": targetOg,
        "ebc": ebc == null ? null : ebc,
        "srm": srm == null ? null : srm,
        "ph": ph == null ? null : ph,
        "attenuation_level": attenuationLevel,
        "volume": volume.toMap(),
        "boil_volume": boilVolume.toMap(),
        "method": method.toMap(),
        "ingredients": ingredients.toMap(),
        "food_pairing": List<String>.from(foodPairing.map((x) => x)),
        "brewers_tips": brewersTips,
        "contributed_by": contributedByValues.reverse[contributedBy],
    };
}

class BoilVolume {
    double value;
    Unit unit;

    BoilVolume({
        this.value,
        this.unit,
    });

    factory BoilVolume.fromMap(Map<String, dynamic> json) => BoilVolume(
        value: json["value"].toDouble(),
        unit: unitValues.map[json["unit"]],
    );

    Map<String, dynamic> toMap() => {
        "value": value,
        "unit": unitValues.reverse[unit],
    };
}

enum Unit { LITRES, GRAMS, KILOGRAMS, CELSIUS }

final unitValues = EnumValues({
    "celsius": Unit.CELSIUS,
    "grams": Unit.GRAMS,
    "kilograms": Unit.KILOGRAMS,
    "litres": Unit.LITRES
});

enum ContributedBy { SAM_MASON_SAMJBMASON, ALI_SKINNER_ALI_SKINNER }

final contributedByValues = EnumValues({
    "Ali Skinner <AliSkinner>": ContributedBy.ALI_SKINNER_ALI_SKINNER,
    "Sam Mason <samjbmason>": ContributedBy.SAM_MASON_SAMJBMASON
});

class Ingredients {
    List<Malt> malt;
    List<Hop> hops;
    String yeast;

    Ingredients({
        this.malt,
        this.hops,
        this.yeast,
    });

    factory Ingredients.fromMap(Map<String, dynamic> json) => Ingredients(
        malt: List<Malt>.from(json["malt"].map((x) => Malt.fromMap(x))),
        hops: List<Hop>.from(json["hops"].map((x) => Hop.fromMap(x))),
        yeast: json["yeast"],
    );

    Map<String, dynamic> toMap() => {
        "malt": List<String>.from(malt.map((x) => x.toMap())),
        "hops": List<String>.from(hops.map((x) => x.toMap())),
        "yeast": yeast,
    };
}

class Hop {
    String name;
    BoilVolume amount;
    Add add;
    Attribute attribute;

    Hop({
        this.name,
        this.amount,
        this.add,
        this.attribute,
    });

    factory Hop.fromMap(Map<String, dynamic> json) => Hop(
        name: json["name"],
        amount: BoilVolume.fromMap(json["amount"]),
        add: addValues.map[json["add"]],
        attribute: attributeValues.map[json["attribute"]],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "amount": amount.toMap(),
        "add": addValues.reverse[add],
        "attribute": attributeValues.reverse[attribute],
    };
}

enum Add { START, MIDDLE, END, DRY_HOP }

final addValues = EnumValues({
    "dry hop": Add.DRY_HOP,
    "end": Add.END,
    "middle": Add.MIDDLE,
    "start": Add.START
});

enum Attribute { BITTER, FLAVOUR, AROMA, ATTRIBUTE_FLAVOUR }

final attributeValues = EnumValues({
    "aroma": Attribute.AROMA,
    "Flavour": Attribute.ATTRIBUTE_FLAVOUR,
    "bitter": Attribute.BITTER,
    "flavour": Attribute.FLAVOUR
});

class Malt {
    String name;
    BoilVolume amount;

    Malt({
        this.name,
        this.amount,
    });

    factory Malt.fromMap(Map<String, dynamic> json) => Malt(
        name: json["name"],
        amount: BoilVolume.fromMap(json["amount"]),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "amount": amount.toMap(),
    };
}

class Method {
    List<MashTemp> mashTemp;
    Fermentation fermentation;
    String twist;

    Method({
        this.mashTemp,
        this.fermentation,
        this.twist,
    });

    factory Method.fromMap(Map<String, dynamic> json) => Method(
        mashTemp: List<MashTemp>.from(json["mash_temp"].map((x) => MashTemp.fromMap(x))),
        fermentation: Fermentation.fromMap(json["fermentation"]),
        twist: json["twist"] == null ? null : json["twist"],
    );

    Map<String, dynamic> toMap() => {
        "mash_temp": List<String>.from(mashTemp.map((x) => x.toMap())),
        "fermentation": fermentation.toMap(),
        "twist": twist == null ? null : twist,
    };
}

class Fermentation {
    BoilVolume temp;

    Fermentation({
        this.temp,
    });

    factory Fermentation.fromMap(Map<String, dynamic> json) => Fermentation(
        temp: BoilVolume.fromMap(json["temp"]),
    );

    Map<String, dynamic> toMap() => {
        "temp": temp.toMap(),
    };
}

class MashTemp {
    BoilVolume temp;
    int duration;

    MashTemp({
        this.temp,
        this.duration,
    });

    factory MashTemp.fromMap(Map<String, dynamic> json) => MashTemp(
        temp: BoilVolume.fromMap(json["temp"]),
        duration: json["duration"] == null ? null : json["duration"],
    );

    Map<String, dynamic> toMap() => {
        "temp": temp.toMap(),
        "duration": duration == null ? null : duration,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
