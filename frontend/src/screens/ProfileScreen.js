import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { logout } from "../actions/userAction";

function ProfileScreen(props) {
    const userSignin = useSelector(state => state.userSignin);
    const { userInfo } = userSignin;
    const dispatch = useDispatch();

    useEffect(() => {
        if (!userInfo) {
            props.history.push("/signin");
        }
    }, [userInfo, props.history]);

    const handleLogout = () => {
        dispatch(logout());
        props.history.push("/");
    };

    return (
        <div className="form">
            <div className="form-container">
                <h2>User Profile</h2>
                {userInfo && (
                    <ul>
                        <li>
                            <strong>Name:</strong> {userInfo.name}
                        </li>
                        <li>
                            <strong>Email:</strong> {userInfo.email}
                        </li>
                        <li>
                            <strong>Admin:</strong> {userInfo.isAdmin ? "Yes" : "No"}
                        </li>
                    </ul>
                )}
                <button onClick={handleLogout} className="button secondary">
                    Sign Out
                </button>
            </div>
        </div>
    );
}

export default ProfileScreen;