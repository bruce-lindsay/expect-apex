const handlebars = require('handlebars');
const fs = require('fs');

const dataInteger = {
    datatype: 'Integer',
    lowestValue: 4,
    middleValue: 5,
    highestValue: 6
};

const dataDate = {
    datatype: 'Date',
    lowestValue: 'Date.newInstance(2001, 03, 01)',
    middleValue: 'Date.newInstance(2001, 03, 02)',
    highestValue: 'Date.newInstance(2001, 03, 03)'
};

const dataDateTime = {
    datatype: 'Datetime',
    lowestValue: 'Datetime.newInstance(70000)',
    middleValue: 'Datetime.newInstance(80000)',
    highestValue: 'Datetime.newInstance(90000)'
};

const dataString = {
    datatype: 'String',
    lowestValue: '\'aaa\'',
    middleValue: '\'bbb\'',
    highestValue: '\'ccc\''
};


const types = [dataInteger, dataDate, dataDateTime, dataString];

handlebars.registerHelper('upper', function(str) {
    return str.toUpperCase();
});

const copyXml = function(targetFile) {
    fs.readFile('source.cls-meta.txt', 'utf-8', function(err, data) {
        if(err) {
            console.error(err);
            return;
        }
        fs.writeFile(targetFile, data);
    });
};

fs.readFile('my-template.hbs', 'utf-8', function(err, data) {
    if(err) {
        console.error(err);
        return;
    }
    console.log('loaded file ' + data.length);
    const templateClass = handlebars.compile(data);
    types.forEach(function(element) {
        const fileName = 'Expect' + element.datatype;
        fs.writeFile(fileName + '.cls', templateClass(element));
        copyXml(fileName + '.cls-meta.xml');
    });
});

fs.readFile('my-template-test.hbs', 'utf-8', function(err, data) {
    if(err) {
        console.error(err);
        return;
    }
    const templateClass = handlebars.compile(data);
    types.forEach(function(element) {
        const fileName = 'Expect' + element.datatype + '_Tests';
        fs.writeFile(fileName + '.cls', templateClass(element));
        copyXml(fileName + '.cls-meta.xml');
    });
});