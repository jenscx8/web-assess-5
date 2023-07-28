import { DataTypes, Model } from 'sequelize';
import util from 'util';
import connectToDB from './db.js';

const db = await connectToDB('postgresql:///animals');

export class Human extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }

  getFullName() {
    // TODO: Implement this method
  }
}

// TODO: Human.init()
Human.init({
  humanId: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  fname: {
    type: DataTypes.STRING(42),
    allowNull: false
  },
  lname: {
    type: DataTypes.STRING(42),
    allowNull: false
  }, 
  email: {
    type: DataTypes.STRING(42),
    allowNull: false
  }
},{modelName: 'human', sequelize: db})

export class Animal extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }
}

// TODO: Animal.init()
Animal.init({
  animalId: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false
  },
  name: {
    type: DataTypes.STRING(42),
    allowNull: false
  },
  species: {
    type: DataTypes.STRING(42),
    allowNull: false
  },
  birthYear: {
    type: DataTypes.INTEGER
  }

},{modelName: 'animal', sequelize: db})

// TODO: Define Relationship
Human.hasMany(Animal, {foreignKey: 'animalId'})
Animal.belongsTo(Human, {foreignKey: 'humanId'})

await db.sync()

export default db;
