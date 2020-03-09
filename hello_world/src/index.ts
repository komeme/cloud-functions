import * as functions from 'firebase-functions';

export const exec = functions.https.onRequest((request, response) => {
 response.send("Hello World!");
});
