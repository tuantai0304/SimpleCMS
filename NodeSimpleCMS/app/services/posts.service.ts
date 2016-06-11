import { Injectable }     from "@angular/core";
import { Http, Response } from "@angular/http";
import { _default }       from "../classes/_default";
import { Post }           from "../classes/post";
import { Logger }         from "../classes/logger";

@Injectable()
export class PostsService {

    private _default: _default;

    public post: Post;

    public postList: Post[];

    constructor(http: Http) {
        this._default = new _default(http);
        this.post = new Post();
        this.postList = null;
    }

    public getPost(id: number): Post {
        if (id > 0) {
            this._default.httpDefaults.url = "/api/v1/Posts/Get/" + id;
            this._default.httpDefaults.includeKey = true;

            let promise = this._default.post<Post>();
            promise.then(
                post => this.post = post
            );

            return this.post;
        }
    }

    public getAllPosts(): any {
        this._default.httpDefaults.url = "/api/v1/Posts/AllPosts";
        this._default.httpDefaults.includeKey = true; 
        let callbackFunction = function extractData(res: Response): any {
            let response = res.json();
            let posts = [];
            // extract response data depending on http status code 
            // errors / messages logged to console
            if (response.httpStatusCode === 200) {
                if (response.data != null) {
                    for (var i = 0, post; post = response.data[i++];) {
                        posts.push(new Post(parseInt(post["iD"], 10), post["title"], post["content"], post["created"], String(post["visible"]).toLowerCase() === "true", String(post["attachment"]).toLowerCase() === "true"));
                    }
                } else {
                    response = {}
                }
                Logger.LogMessages(response.messages); 
            }
            if (response.httpStatusCode > 200) {
                Logger.LogErrors(response.errors);
                response = {};
            }

            return posts;
        }
   
        return this._default.post<Post[]>(callbackFunction);
    }

    // callback method used for http requests 
    // @param Response 
    // @returns 
    public extractData<T>(res: Response): T {
        let response = res.json();

        // extract response data depending on http status code 
        // errors / messages logged to console
        if (response.HttpStatusCode === 200) {
            if (response.Data != null) {
                response = response.Data;
            } else {
                console.log(response.Message);
                response = {}
            }
        }
        if (response.length > 0 && response.HttpStatusCode > 200) {
            console.log(response.Errors);
            response = {};
        }

        return response;
    }
}